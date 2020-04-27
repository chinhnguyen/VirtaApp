//
//  NearbyStationService.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import Combine
import VirtaSdk

class NearbyStationService {
    
    static let shared = NearbyStationService()
    
    func listNearbyStations(from: Int = 0, limit: Int = 10) -> Future<[BasicStationInfo], Error> {
//        return Future { promise in
//            let locationService = LocationService()
//            locationService.run { location in
//                if let location = location {
//                    print(location)
//                }
//                promise(.success([]))
//            }
//        }
        
        
        return StationRepository.listByLocation(latMin: 59.192059, latMax: 61.192059, longMin: 23.945831, longMax:     25.945831, from: from, limit: limit)
    }
}
