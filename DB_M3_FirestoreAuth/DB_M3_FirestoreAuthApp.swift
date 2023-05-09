//
//  DB_M3_FirestoreAuthApp.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/6/23.
//

import SwiftUI
import Firebase
// Firebase Docs > Build > sign in with pre-built UI
// https://firebase.google.com/docs/auth/ios/firebaseui?hl=en&authuser=0#swift


@main
struct DB_M3_FirestoreAuthApp: App {
    // If we were doing Google or Facebook logins, we would need a callback handler
    // b/c it boots out to a a special widget then calls back to handshake
    
    
    init() {
        // must have the " pod 'Firebase/Firestore' " to use this
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            // instead of ContentView, let's start in LaunchView
            LaunchView()
        }
    }
}
