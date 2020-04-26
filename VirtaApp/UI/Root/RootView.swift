//
//  RootView.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel = RootViewModel()
    
    var body: some View {
        VStack {
            if viewModel.signedIn {
                StationList()
            } else {
                LoginView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
