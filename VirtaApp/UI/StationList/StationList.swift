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
            List(viewModel.stations, id: \.id) { station in
                StationRow(station: station)
            }
            .navigationBarTitle("Nearby",displayMode: .inline)
        }.onAppear { self.viewModel.reload()}
    }
    
    
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        StationList()
    }
}
