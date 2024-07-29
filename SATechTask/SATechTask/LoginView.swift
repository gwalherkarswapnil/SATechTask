//
//  LoginView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

import SwiftUI
import SwiftUI

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel(authService: AuthNetworkService())
    @State private var isLoginMode = true
    @State private var showWelcomeView = false
    @State private var animateLogo = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                VStack(spacing: 16) {
                    Image(systemName: "lock.shield.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .scaleEffect(animateLogo ? 1.0 : 0.7)
                        .animation(.easeIn(duration: 0.6), value: animateLogo)
                        .onAppear {
                            animateLogo = true
                        }

                    Text(isLoginMode ? Constants.Login.loginButton : Constants.Login.signUpButton)
                        .font(.largeTitle)
                        .padding()

                    if isLoginMode {
                        LoginFields(viewModel: viewModel)
                            .transition(.slide)
                            .animation(.easeInOut)
                    } else {
                        SignUpFields(viewModel: viewModel)
                            .transition(.slide)
                            .animation(.easeInOut)
                    }

                    Button(action: {
                        if isLoginMode {
                            viewModel.loginUser { success in
                                if success {
                                    showWelcomeView = true
                                } else {
                                    // Handle login failure (show an alert, etc.)
                                    viewModel.alertMessage = "Login failed. Please try again."
                                    viewModel.showAlert = true
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

                    NavigationLink(destination: WelcomeInspectionListView(), isActive: $showWelcomeView) {
                        EmptyView()
                    }
                }
                .padding()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden()

                Spacer()

                Button(action: {
                    withAnimation(.easeInOut) {
                        isLoginMode.toggle()
                    }
                }) {
                    Text(isLoginMode ? Constants.Login.signUpButton : Constants.Login.loginButton)
                }
                .padding()

                Spacer()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}

struct LoginFields: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 16) {
            TextField(Constants.Login.emailPlaceholder, text: $viewModel.email)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .animation(.bouncy)

            SecureField(Constants.Login.passwordPlaceholder, text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .animation(.bouncy)
        }
    }
}

struct SignUpFields: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 16) {
            TextField(Constants.Login.emailPlaceholder, text: $viewModel.email)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .animation(.bouncy)

            SecureField(Constants.Login.passwordPlaceholder, text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .animation(.bouncy)
        }
    }
}

