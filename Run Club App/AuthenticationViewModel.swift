//
//  AuthenticationViewModel.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-09-07.
//

import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var state: SignInState = .signedOut
    
    enum SignInState {
        case signedIn
        case signedOut
      }
    
    func login(email: String, password: String) -> Void {
        Auth.auth().signIn(withEmail: email, password: password) { (success, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("Signing In Success!")
                //self.state = .signedIn
            }
        }
    }
    
    func signup(name: String, email: String, password: String) -> Void {
        Auth.auth().createUser(withEmail: email, password: password) { (success, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("Signing Up Success!")
                //self.state = .signedIn
            }
        }
    }
    
}
