//
//  LoginView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

import SwiftUI
struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel(authService: AuthNetworkService())
    
    @State private var isLoginMode = true

    var body: some View {
        NavigationView {
            VStack {
                Text(isLoginMode ? "Login" : "Sign Up")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: {
                    if isLoginMode {
                        viewModel.loginUser()
                    } else {
                        viewModel.registerUser()
                    }
                }) {
                    Text(isLoginMode ? "Login" : "Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                
                Button(action: {
                    isLoginMode.toggle()
                }) {
                    Text(isLoginMode ? "Don't have an account? Sign Up" : "Already have an account? Login")
                        .foregroundColor(.blue)
                }
                
                NavigationLink(destination: WelcomeInspectionListView(), isActive: $viewModel.isAuthenticated) {
                    EmptyView()
                }
            }
            .padding()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}
