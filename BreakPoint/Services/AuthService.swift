//
//  AuthService.swift
//  BreakPoint
//
//  Created by Stanley Pan on 22/09/2017.
//  Copyright © 2017 Stanley Pan. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping CompletionHandlerWithError) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDatabaseUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping CompletionHandlerWithError) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
