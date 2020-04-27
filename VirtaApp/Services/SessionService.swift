//
//  AuthService.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/26/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import Combine

class SessionService {
    
    static let shared = SessionService()
    
    private let defaults = UserDefaults.standard
    
    @Published var token = ""
    
    init() {
        token = defaults.string(forKey: "token") ?? ""
    }
    
    func signin(username: String, password: String) -> AnyPublisher<Void, UserAuthError> {
        return UserRepository
            .signin(username: username, password: password)
            .map { token -> () in
                self.token = token
                self.defaults.setValue(token, forKey: "token")
            }
            .eraseToAnyPublisher()
    }
}
