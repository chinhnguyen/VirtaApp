//
//  StationRow.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI
import VirtaSdk

struct StationRow: View {
    var stationInfoEx: StationInfoEx
    
    var body: some View {
        
        let station = stationInfoEx.info
        let address = [
            station.address ?? "",
            station.city ?? ""
            ]
            .filter { v in !v.isEmpty}
            .joined(separator: ", ")
        
        return VStack {
            HStack {
                Text(station.name ?? "")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
                Text("\(Int(stationInfoEx.distanceInMeters))m")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color("PrimaryTextColor"))
                Image("icNavigate")
            }
            HStack {
                Text(address)
                    .font(.caption)
                    .foregroundColor(Color("PrimaryTextColor"))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        .padding(.horizontal, 16.0)
        
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        let evses = [Connector(connectorID: 1, type:.ccs, currentType: .ac, maxKw: 22.0), Connector(connectorID: 2, type:.ccs, currentType: .ac, maxKw: 22.0)]
        let stationInfo = BasicStationInfo(id: 1, latitude: 48.278067, longitude:  16.456204, name: "Sahakotalo Kamppi", city: "Helsinki", address: "Runeberginkatu 1", provider: "Hubject", evses: evses, icon: nil, isRemoved: nil, isPrivate: nil)
        let stationInfoEx = StationInfoEx(info: stationInfo, distanceInMeters: 100.0)
        
        return StationRow(stationInfoEx: stationInfoEx)
            .previewLayout(.fixed(width: 320, height: 106))
    }
}
