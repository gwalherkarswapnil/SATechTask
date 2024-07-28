//
//  LoginViewModel.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func loginUser(completion: @escaping (Bool) -> Void) {
        authService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.isAuthenticated = true
                    completion(true)
                case .failure(let error):
                    self?.alertMessage = error.localizedDescription
                    self?.showAlert = true
                    completion(false)
                }
            }
        }
    }

    
    
    func registerUser() {
        authService.register(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.alertMessage = "Registration successful. Please log in."
                    self?.showAlert = true
                case .failure(let error):
                    self?.alertMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
}
