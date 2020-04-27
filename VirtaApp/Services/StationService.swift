//
//  StationService.swift
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
    public var distanceInMeters: Double = 0
}

struct StationEx {
    public var station: Station
    public var distanceInMeters: Double = 0
}

enum LocationError: Error {
    case couldNotGetCurrentLocation
}

class StationService {
    
    static let shared = StationService()
    
    var locationService: LocationService?
    
    func listNearbyStations(from: Int = 0, limit: Int = 10) -> AnyPublisher<[StationInfoEx], Error> {
        return LocationService
            .getCurrentLocation()
            .flatMap { location -> AnyPublisher<[StationInfoEx], Error>  in
                guard let location = location else {
                    return Future { promise in
                        promise(.failure(LocationError.couldNotGetCurrentLocation))
                    }.eraseToAnyPublisher()
                }
                let lat = location.coordinate.latitude
                let long = location.coordinate.longitude
                let stations = StationRepository.listByLocation(
                    latMin: lat - 0.015,
                    latMax: lat + 0.015,
                    longMin: long - 0.015,
                    longMax: long + 0.015,
                    from: from,
                    limit: limit
                )
                return stations
                    .map { infos in
                        infos.map { info in
                            let stationLocation = CLLocation(latitude: info.latitude ?? 0, longitude: info.longitude ?? 0)
                            let distanceInMeters = location.distance(from: stationLocation)
                            return StationInfoEx(info: info, distanceInMeters: distanceInMeters)
                        }.sorted { (s1, s2) in
                            s1.distanceInMeters < s2.distanceInMeters
                        }
                }.eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
    
    func loadStation(id: Int) -> AnyPublisher<StationEx, Error> {
        return LocationService
            .getCurrentLocation()
            .flatMap { location -> AnyPublisher<StationEx, Error>  in
                guard let location = location else {
                    return Future { promise in
                        promise(.failure(LocationError.couldNotGetCurrentLocation))
                    }.eraseToAnyPublisher()
                }
                return StationRepository.loadById(id).map { station in
                    let stationLocation = CLLocation(latitude: station.latitude ?? 0, longitude: station.longtitude ?? 0)
                    let distanceInMeters = location.distance(from: stationLocation)
                    
                    return StationEx(station: station, distanceInMeters: distanceInMeters)
                }.eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
