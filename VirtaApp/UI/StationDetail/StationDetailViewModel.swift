//
//  StationDetailViewModel.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import Combine
import VirtaSdk

extension StationDetail {
    class StationDetailViewModel: ObservableObject {
        var reloadCancellable: AnyCancellable?
        
        @Published var station: StationEx?
        @Published var loading = false
        @Published var loadingError: String?
        
        func reload(stationId: Int) {
            loading  = true
            loadingError = ""
            reloadCancellable = StationService.shared
                .loadStation(id: stationId)
                .sink(receiveCompletion: { evt in
                    self.loading  = false
                    switch evt {
                    case .finished:
                        break
                    case .failure(let error):
                        self.loadingError = error.localizedDescription
                    }
                }, receiveValue: { station in
                    self.station = station
                })
            
        }
    }
}
