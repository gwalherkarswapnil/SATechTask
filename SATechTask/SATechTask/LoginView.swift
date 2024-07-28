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
    @State private var showWelcomeView = false
    
        var body: some View {
            NavigationView {
                VStack {
                    Text(isLoginMode ? Constants.Login.loginButton : Constants.Login.signUpButton)
                        .font(.largeTitle)
                        .padding()
                    
                    TextField(Constants.Login.emailPlaceholder, text: $viewModel.email)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    SecureField(Constants.Login.passwordPlaceholder, text: $viewModel.password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    Button(action: {
                        if isLoginMode {
                            viewModel.loginUser { success in
                                if success {
                                    showWelcomeView = true
                                } else {
                                    // Handle login failure (show an alert, etc.)
                                }
                            }
                        } else {
                            viewModel.registerUser()
                        }
                    }) {
                        Text(isLoginMode ? Constants.Login.loginButton : Constants.Login.signUpButton)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(5)
                    }

                    NavigationLink(destination: WelcomeView(), isActive: $showWelcomeView) {
                        EmptyView()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isLoginMode.toggle()
                    }) {
                        Text(isLoginMode ? Constants.Login.signUpButton : Constants.Login.loginButton)
                    }
                    .padding()
                }
                .padding()
                .navigationBarHidden(true)
            }
        }
    }

