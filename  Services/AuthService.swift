//
//  AuthService.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 19.02.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    private init() { }
    
    private let auth = Auth.auth()
    
    private var currentUser: User? {
        return auth.currentUser
    }
    
    func signUP(login: String,
                password: String,
                completion: @escaping(Result<User, Error>) -> ()){
        auth.createUser(withEmail: login, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
            
        }
    }
    
}
