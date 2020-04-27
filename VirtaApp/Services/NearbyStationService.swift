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
        return Future { promise in
            promise(.success([]))
        }
//        return StationRepository
//        .listByLocation(latMin: <#T##Double#>, latMax: <#T##Double#>, longMin: <#T##Double#>, longMax: <#T##Double#>, from: <#T##Int#>, limit: <#T##Int#>)
//            .map { token -> () in
//                self.token = token
//                self.defaults.setValue(token, forKey: "token")
//            }
//            .eraseToAnyPublisher()
    }
}
