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
        let connectors = (stationInfoEx.info.evses ?? []).chunked(into: 3)
        
        return VStack(spacing: 0.0) {
            HStack(alignment: .top) {
                Text(station.name ?? "")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
                Text(stationInfoEx.distanceInMeters.asDistantText)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color("PrimaryTextColor"))
                    .padding(.top, 4.0)
                Image("icNavigate")
            }
            HStack(alignment: .top) {
                Text(address)
                    .font(.caption)
                    .foregroundColor(Color("PrimaryTextColor"))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Spacer()
                .frame(height: 8.0)
            VStack(spacing: 16.0) {
                ForEach(0..<connectors.count) { index in
                    HStack(spacing: 16.0) {
                        ForEach(connectors[index], id:\.connectorID) { cn in
                            ConnectorView(connector: cn)
                        }
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct StationRow_Previews: PreviewProvider {
    static var previews: some View {
        let evses = [
            Connector(connectorID: 1, type:.ccs, currentType: .ac, maxKw: 22.0),
            Connector(connectorID: 2, type:.ccs, currentType: .ac, maxKw: 22.0),
            Connector(connectorID: 3, type:.ccs, currentType: .ac, maxKw: 22.0),
            Connector(connectorID: 4, type:.ccs, currentType: .ac, maxKw: 22.0),
            Connector(connectorID: 5, type:.ccs, currentType: .ac, maxKw: 22.0),
            Connector(connectorID: 6, type:.ccs, currentType: .ac, maxKw: 22.0)
        ]
        let stationInfo = BasicStationInfo(id: 1, latitude: 48.278067, longitude:  16.456204, name: "Sahakotalo Kamppi", city: "Helsinki", address: "Runeberginkatu 1", provider: "Hubject", evses: evses, icon: nil, isRemoved: nil, isPrivate: nil)
        let stationInfoEx = StationInfoEx(info: stationInfo, distanceInMeters: 100.0)
        
        return StationRow(stationInfoEx: stationInfoEx)
            .previewLayout(.fixed(width: 320, height: 180))
    }
}
