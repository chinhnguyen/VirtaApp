//
//  StationRepository.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import VirtaSdk
import Combine

class StationRepository {
    open class func listByLocation(latMin: Double, latMax: Double, longMin: Double, longMax: Double, from: Int, limit: Int) -> Future<[BasicStationInfo], Error> {
        return Future { promise in
            VirtaSdkAPI.StationsInformationAPI.gETStations(latMin: latMin, latMax: latMax, longMin: longMin, longMax: longMax, limit: 10) { res in
                promise(res)
            }
        }
    }
    
    open class func loadById(_ id: Int) -> Future<Station, Error> {
        return Future { promise in
            VirtaSdkAPI.StationsInformationAPI.gETStationsId(id: id) { res in
                promise(res)
            }
        }
    }
}
