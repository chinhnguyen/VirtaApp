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
import CoreLocation


struct StationInfoEx {
    public var info: BasicStationInfo
    public var distance: String = ""
}

class NearbyStationService {
    
    static let shared = NearbyStationService()
    
    var locationService: LocationService?
    
    func calculateDistance(fromLat: Double, fromLong: Double, toLat: Double, toLong: Double) -> String {
        return "50m"
    }

    func listNearbyStations(from: Int = 0, limit: Int = 10) -> AnyPublisher<[StationInfoEx], Error> {
        return LocationService
            .getCurrentLocation()
            .flatMap { location -> AnyPublisher<[StationInfoEx], Error>  in
                guard let (lat, long) = location else {
                    return Future<[StationInfoEx], Error> { promise in
                        promise(.success([]))
                    }.eraseToAnyPublisher()
                }
                let stations = StationRepository.listByLocation(
                    latMin: lat - 0.02,
                    latMax: lat + 0.02,
                    longMin: long - 0.02,
                    longMax: long + 0.02,
                    from: from,
                    limit: limit
                )
                return stations.map { infos in
                    infos.map { info in
                        let distance = self.calculateDistance(fromLat: lat, fromLong: long, toLat: info.latitude ?? 0, toLong: info.longitude ?? 0)
                        return StationInfoEx(info: info, distance: distance)
                    }
                }.eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
