//
//  UserRepository.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/26/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import Foundation
import VirtaSdk
import Combine

enum UserAuthError: Error {
    case invalidUserNamePassword(_ error: Error?)
}

class UserRepository {
    open class func signin(username: String, password: String) -> Future<String, UserAuthError> {
        return Future<String, UserAuthError> { promise in
            VirtaSdkAPI.AuthenticationAPI.pOSTAuth(body: InlineObject(email: username, code: password)) { res in
                switch(res) {
                case .failure(let error):
                    promise(.failure(.invalidUserNamePassword(error)))
                case .success(let body):
                    guard let token = body.token, !token.isEmpty else {
                        promise(.failure(.invalidUserNamePassword(nil)))
                        return
                    }
                    promise(.success(token))
                }
            }

        }
    }
}
