//
//  StationList.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI

struct StationList: View {
    @ObservedObject var viewModel = StationListViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "NavBarTitleColor") as Any]
        
        
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.stations, id: \.info.id) { station in
                    ZStack {
                        NavigationLink(destination: StationDetail(stationId: station.info.id ?? 0)) {
                            EmptyView()
                        }.hidden()
                        StationRow(stationInfoEx: station)
                    }
                }
            }
            .navigationBarTitle("Nearby",displayMode: .inline)
            .navigationBarHidden(false)
        }.onAppear { self.viewModel.reload()}
    }
    
    
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        StationList()
    }
}
