//
//  StationDetail.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI

struct StationDetail: View {
    @ObservedObject var viewModel = StationDetailViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var stationId: Int
    
    var body: some View {
        Button("GOBACK") {
            self.presentationMode.wrappedValue.dismiss()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .onAppear {
            self.viewModel.reload(stationId: self.stationId)
        }
    }
}

struct StationDetail_Previews: PreviewProvider {
    static var previews: some View {
        StationDetail(stationId: 10)
    }
}
