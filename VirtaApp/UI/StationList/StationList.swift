//
//  StationList.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI

struct StationList: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "NavBarTitleColor") as Any]
    }
    
    var body: some View {
        NavigationView {
            Text("hello")
                .navigationBarTitle("Nearby",displayMode: .inline)
        }
    }
}

struct StationList_Previews: PreviewProvider {
    static var previews: some View {
        StationList()
    }
}
