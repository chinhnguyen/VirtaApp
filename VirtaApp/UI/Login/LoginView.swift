//
//  LoginView.swift
//  VirtaApp
//
//  Created by Chinh Nguyen on 4/26/20.
//  Copyright © 2020 Virta. All rights reserved.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        let loginButtonBgColor = viewModel.canLogin
            ? Color("PrimaryButtonBackgroundColor")
            : Color("PrimaryButtonDisabledBackgroundColor")
        
        return VStack {
            Spacer()
                .frame(height: 32.0)
            
            Text("Log In and Charge!")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryTextColor"))
            
            Image("logIn")
                .padding(.vertical, 16.0)
                .scaledToFit()
            
            IconTextField(icon: "icPerson", placeholder: "Username", text: $viewModel.username)
                .padding(.horizontal, 32.0)
            Spacer()
                .frame(height: 16.0)
            
            IconSecureField(icon: "icLock", placeholder: "Password", text: $viewModel.password)
                .padding(.horizontal, 32.0)
            Spacer()
                .frame(height: 64.0)
            
            Button(action: viewModel.login) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(loginButtonBgColor)
                    Text("Log in")
                        .fontWeight(.bold)
                        .foregroundColor(Color("PrimaryTextColor"))
                }
            }
            .frame(width: 120.0, height: 44.0)
            .disabled(!viewModel.canLogin)
            
            Spacer()
            
        }
        .alert(isPresented: $viewModel.logInError) {
            Alert(title: Text("Login failed"), message: Text(viewModel.logInErrorMessage), dismissButton: .default(Text("Close"), action: {
                self.viewModel.clearError()
            }))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
