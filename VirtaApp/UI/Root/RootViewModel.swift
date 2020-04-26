//
//  RootViewModel.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/27/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation

import Foundation
import SwiftUI
import Combine

extension RootView {
    class RootViewModel: ObservableObject {
        var cancellableSet = Set<AnyCancellable>()
        
        @Published var signedIn = false
        
        init() {
            SessionService.shared.$token
                .map { token in !token.isEmpty }
                .assign(to: \.signedIn, on: self)
                .store(in: &cancellableSet)
        }
    }
}
