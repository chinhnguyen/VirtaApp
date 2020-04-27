//
//  ConnectorView.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI
import VirtaSdk

struct ConnectorView: View {
    
    var connector: Connector
    
    var body: some View {
        HStack {
            VStack {
                Image("icType2")
            }
            VStack {
                Text("\(Int(connector.maxKw ?? 0))")
                    .font(Font.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("kW")
                    .font(.footnote)
                    .foregroundColor(Color("PrimaryTextColor"))
            }
        }
    }
}

struct ConnectorView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectorView(connector: Connector(connectorID: 0, type: .ccs, currentType: .ac, maxKw: 22))
                    .previewLayout(.fixed(width: 80, height: 64))

    }
}
