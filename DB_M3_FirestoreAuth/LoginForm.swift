//
//  LoginForm.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/7/23.
//

import Foundation
import SwiftUI
import FirebaseAuthUI
import FirebaseEmailAuthUI
// import FirebaseUI (old) - now FirebaseAuthUI + FirebaseEmailAuthUI

struct LoginForm: UIViewControllerRepresentable {
    // must implement several funcs, possibly a coordinator, etc
    
    
    // changed output type to UINavigationController, removed 'some'
    func makeUIViewController(context: Context) -> UINavigationController {
        
        // get a handle for the default.  optional
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            // never seen it return nil, but it's possible
            return UINavigationController()
        }
        
        // array of valid providers
        let providers = [FUIEmailAuth()]
        // assign all of our providers to our authUI object/widget
        authUI!.providers = providers
        
        return authUI!.authViewController()
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
