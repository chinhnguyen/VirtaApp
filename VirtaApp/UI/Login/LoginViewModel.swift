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
        var cancellableSet = Set<AnyCancellable>()
        
        @Published var username: String = "candidate1@virta.global"
        @Published var password: String = "1Candidate!"
        
        @Published var loggingIn = false        
        @Published var logInErrorMessage = ""
        @Published var logInError = false
        
        @Published var canLogin = false
        
        init() {
            $logInErrorMessage
                .map { err in !err.isEmpty }
                .assign(to: \.logInError, on: self)
                .store(in: &cancellableSet)
            
            Publishers.CombineLatest3($username, $password, $loggingIn)
                .map { username, password, loggingIn -> Bool in
                    !username.isEmpty && !password.isEmpty && !loggingIn
            }
            .assign(to: \.canLogin, on: self)
            .store(in: &cancellableSet)
        }
        
        var logInCancellable: AnyCancellable?
        func login() {
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
