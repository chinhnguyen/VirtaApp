//
//  StationListViewModel.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import Combine
import VirtaSdk

extension StationList {
    class StationListViewModel: ObservableObject {
        var cancellableSet = Set<AnyCancellable>()
        var reloadCancellable: AnyCancellable?
        
        @Published var stations: [BasicStationInfo] = []
        @Published var loading = false
        @Published var loadingError: String?
        
        func reload() {
            loading  = true
            loadingError = ""
            reloadCancellable = NearbyStationService.shared
                .listNearbyStations()
                .sink(receiveCompletion: { evt in
                    self.loading  = false
                    switch evt {
                    case .finished:
                        break
                    case .failure(let error):
                        self.loadingError = error.localizedDescription
                    }
                }, receiveValue: { stations in
                    self.stations = stations
                })
            
        }
    }
}
