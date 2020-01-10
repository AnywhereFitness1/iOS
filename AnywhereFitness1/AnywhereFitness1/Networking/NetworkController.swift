//
//  NetworkController.swift
//  AnywhereFitness1
//
//  Created by Bobby Keffury on 1/8/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class NetworkController {
    typealias CompletionHandler = (Error?) -> Void
    
    private let baseURL = URL(string: "https://anywhere-fitness92.herokuapp.com/api/auth/")
    var token: Token?
    var classes: [Class] = []
    
    //Cient & Instructor
    
    func register(department: String, username: String, password: String, completion: @escaping CompletionHandler = { _ in }) {
        
        guard let registerURL = baseURL?.appendingPathComponent("register") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: registerURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let userParams = ["department":department, "username":username, "password":password] as [String: Any]
            let json = try JSONSerialization.data(withJSONObject: userParams, options: .prettyPrinted)
            request.httpBody = json
        } catch {
            print("Error encoding user object: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            
            if let error = error { completion(error); return}
            guard let data = data else { completion(NSError()); return}
            
            let decoder = JSONDecoder()
            do {
                self.token = try decoder.decode(Token.self, from: data)
            } catch {
                print("Error decoding bearer object: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    func login(department: String, username: String, password: String, completion: @escaping CompletionHandler = { _ in }) {
        
        guard let requestURL = baseURL?.appendingPathComponent("login") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let userParams = ["department":department, "username":username, "password":password] as [String: Any]
            let json = try JSONSerialization.data(withJSONObject: userParams, options: .prettyPrinted)
            request.httpBody = json
        } catch {
            print("Error encoding user object: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            
            if let error = error { completion(error); return}
            guard let data = data else { completion(NSError()); return}
            
            let decoder = JSONDecoder()
            
            do {
                self.token = try decoder.decode(Token.self, from: data)
                print(String(describing: self.token))
            } catch {
                print("Error decoding bearer object: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    
    //Client
    
    func searchForClasses(with name: String, completion: @escaping (Result<[Class], NetworkError>) -> Void) {
        guard let token = token, let searchURL = baseURL?.appendingPathComponent("search") else { return }
        
        var request = URLRequest(url: searchURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token.token, forHTTPHeaderField: "Authorization")
        
        do {
            let userParams = ["name":name] as [String:Any]
            let json = try JSONSerialization.data(withJSONObject: userParams, options: .prettyPrinted)
            request.httpBody = json
        } catch {
            print("Error encoding search object: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let _ = error {
                completion(.failure(.otherError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let classes = try decoder.decode([Class].self, from: data)
                completion(.success(classes))
            } catch {
                print("Error decoding class object: \(error)")
                completion(.failure(.noDecode))
                return
            }
        }.resume()
    }
    
    
    
    
    //Instructor
    
    func createClass(for classy: Class, completion: @escaping CompletionHandler = { _ in }) {
        
        guard let token = token, let createURL = baseURL?.appendingPathComponent("createclass") else { return }
        
        var request = URLRequest(url: createURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(token.token, forHTTPHeaderField: "Authorization")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(classy)
            request.httpBody = jsonData
        } catch {
            print("Error encoding class object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    func updateClass(for classy: Class, completion: @escaping CompletionHandler = { _ in }) {
        guard let id = classy.id, let token = token, let updateURL = baseURL?.appendingPathComponent("\(id)") else { return }
        
        var request = URLRequest(url: updateURL)
        request.httpMethod = HTTPMethod.put.rawValue
        request.setValue(token.token, forHTTPHeaderField: "Authorization")
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(classy)
            request.httpBody = jsonData
        } catch {
           print("Error encoding edited class: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    func deleteClass(for classy: Class, completion: @escaping CompletionHandler = { _ in }) {
        guard let id = classy.id, let token = token, let deleteURL = baseURL?.appendingPathComponent("\(id)") else { return }
        
        var request = URLRequest(url: deleteURL)
        request.httpMethod = HTTPMethod.delete.rawValue
        request.setValue(token.token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { _, _, error in
            print("Deleted entry with ID: \(id)")
            completion(error)
        }.resume()
    }
    
    func createPunchPass(completion: @escaping CompletionHandler = { _ in }) {
    }
    
}
