//
//  NetworkManager.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import Foundation

protocol AuthService {
    func register(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

protocol InspectionService {
    func fetchInspections(completion: @escaping (Result<[Inspection], Error>) -> Void)
    func submitInspection(inspection: Inspection, completion: @escaping (Result<Bool, Error>) -> Void)
    func fetchRandomInspection(completion: @escaping (Result<Inspection, Error>) -> Void)
    func fetchInspection(by id: Int, completion: @escaping (Result<Inspection, Error>) -> Void)
}


class InspectionNetworkService: InspectionService {
    let baseURL = "http://localhost:5001/api/"
    func fetchRandomInspection(completion: @escaping (Result<Inspection, Error>) -> Void) {
        let url = URL(string: "http://localhost:5001/api/random_inspection")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(InspectionResponse.self, from: data)
                completion(.success(response.inspection))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchInspection(by id: Int, completion: @escaping (Result<Inspection, Error>) -> Void) {
        let url = URL(string: "http://localhost:5001/api/inspections/\(id)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(InspectionResponse.self, from: data)
                completion(.success(response.inspection))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
extension InspectionNetworkService {
    
    func fetchInspections(completion: @escaping (Result<[Inspection], Error>) -> Void) {
        // Implement fetch inspections logic
    }
    
    func submitInspection(inspection: Inspection, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: baseURL + "inspections/submit")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = try? JSONEncoder().encode(inspection)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(true))
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
            }
        }
        task.resume()
    }
}



class AuthNetworkService: AuthService {
    fileprivate let baseURL = "http://localhost:5001/api/"
    
    func register(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: baseURL + "register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(true))
            } else if httpResponse.statusCode == 401 {
                completion(.failure(NSError(domain: "User already exists", code: 401, userInfo: nil)))
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
            }
        }
        task.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: baseURL + "login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(true))
            } else if httpResponse.statusCode == 401 {
                completion(.failure(NSError(domain: "Invalid user or password", code: 401, userInfo: nil)))
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
            }
        }
        task.resume()
    }
}

