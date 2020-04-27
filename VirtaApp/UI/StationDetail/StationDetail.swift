//
//  StationDetail.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI
import VirtaSdk

struct StationDetail: View {
    @ObservedObject var viewModel = StationDetailViewModel()
    
    var stationId: Int
    
    var body: some View {
        StationView(station: viewModel.station)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .onAppear {
                self.viewModel.reload(stationId: self.stationId)
        }
    }
}

struct StationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var station: StationEx?
    
    var body: some View {
        let station = self.station?.station
        let distant = self.station?.distanceInMeters.asDistantText ?? ""
        let address = [
            station?.address ?? "",
            station?.city ?? ""
            ]
            .filter { v in !v.isEmpty}
            .joined(separator: ", ")        
        
        return AnyView(VStack {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(station?.name ?? "Station not found")
                            .font(Font.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(Color("PrimaryTextColor"))
                        Text(address)
                            .font(Font.system(size: 14))
                            .foregroundColor(Color("PrimaryTextColor"))
                    }
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("icX")
                    }
                }
                HStack {
                    Spacer()
                    Text(distant)
                        .font(Font.system(size: 14))
                        .foregroundColor(Color("PrimaryTextColor"))
                    Image("icNavigate")
                }
            }
            .padding(.horizontal, 16.0)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Info and Help")
                        .font(Font.system(size: 14))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("PrimaryTextColor"))
                    Spacer()
                        .frame(height: 8.0)
                    Text("Virta")
                        .foregroundColor(Color("PrimaryTextColor"))
                        .font(Font.system(size: 16))
                    Text("Provider")
                        .foregroundColor(Color("PrimaryTextColor"))
                        .font(Font.system(size: 14))
                }
                Spacer()
            }
            .padding(.horizontal, 16.0)
            HStack  {
                Image("icInfo")
                HStack {
                    VStack(alignment: .leading) {
                        Text("How to Use")
                            .foregroundColor(Color("PrimaryTextColor"))
                            .font(Font.system(size: 16))
                        Text("We are always here to help")
                            .foregroundColor(Color("PrimaryTextColor"))
                            .font(Font.system(size: 14))
                    }
                    Spacer()
                }
                .padding(.horizontal, 8.0)
                .frame(maxWidth: .infinity)
                Image("icChevronRight")
            }
            .frame(maxWidth: .infinity, minHeight: 60)
            .padding(.horizontal, 16.0)
            HStack(spacing: 8.0) {
                Image("icFeedbackSad")
                HStack {
                    VStack(alignment: .leading) {
                        Text("How to Use")
                            .foregroundColor(Color("PrimaryTextColor"))
                            .font(Font.system(size: 16))
                        Text("We are always here to help")
                            .foregroundColor(Color("PrimaryTextColor"))
                            .font(Font.system(size: 14))
                    }
                    Spacer()
                }
                .padding(.horizontal, 8.0)
                .frame(maxWidth: .infinity)
                
                Image("icChevronRight")
            }
            .frame(maxWidth: .infinity, minHeight: 60)
            .padding(.horizontal, 16.0)
            Spacer()
                .frame(height: 32.0)
        })
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        let station = Station(id: 1, name: "Kaapalitehdas Ruoholahti", latitude: 0.0, longtitude: 0.0, icon: 0, address: "Satamankatu 15", city: "Helsinki", openHours: "", provider: "", pictures: nil, evses: nil, alertMessage: "")
        let stationEx = StationEx(station: station, distanceInMeters: 1450)
        return StationView(station: stationEx)
    }
}
