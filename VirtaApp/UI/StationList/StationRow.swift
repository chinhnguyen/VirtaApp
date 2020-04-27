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
    var station: BasicStationInfo
    
    var body: some View {
        VStack {
            HStack {
                Text(station.name ?? "")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryTextColor"))
                Spacer()
                Text("80m")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color("PrimaryTextColor"))
                Image("icNavigate")
            }
            HStack {
                Text([station.address ?? "", station.city ?? ""].joined(separator: ", "))
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
        StationRow(station: BasicStationInfo(id: 1, latitude: 48.278067, longitude:  16.456204, name: "Sahakotalo Kamppi", city: "Helsinki", address: "Runeberginkatu 1", provider: "Hubject", evses: [Connector(connectorID: 1, type:.ccs, currentType: .ac, maxKw: 22.0), Connector(connectorID: 2, type:.ccs, currentType: .ac, maxKw: 22.0)], icon: nil, isRemoved: nil, isPrivate: nil))
    }
}
