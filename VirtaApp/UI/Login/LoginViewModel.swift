//
//  LoginViewModel.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/26/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

extension LoginView {
    class LoginViewModel: ObservableObject {
        @Published var loggingIn = false        
        @Published var logInErrorMessage = "" {
            didSet {
                logInError = !logInErrorMessage.isEmpty
            }
        }
        @Published var logInError = false
        
        var logInCancellable: AnyCancellable?
                
        func login(username: String, password: String) {
            loggingIn  = true
            logInCancellable = SessionService.shared
                .signin(username: username, password: password)
                .sink(receiveCompletion: { evt in
                    self.loggingIn  = false
                    switch evt {
                    case .finished:
                        // TODO: navigate to inner screen
                        print(SessionService.shared.token)
                    case .failure(let error):
                        self.logInErrorMessage = error.localizedDescription
                    }
                }, receiveValue: { _ in
                    // returned token is stored in SessionService
                    // we don't do anything here
                })
        }
        
        func clearError() {
            logInErrorMessage = ""
        }
    }
}
