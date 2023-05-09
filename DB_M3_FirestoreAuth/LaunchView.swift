//
//  LaunchView.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/7/23.
//

import SwiftUI
import FirebaseAuthUI
import FirebaseEmailAuthUI

struct LaunchView: View {
    
    @State var loggedIn = false
    @State var loginFormShowing = false
    
    var body: some View {
        
        // Check the logged in property and show the appropriate view
        if !loggedIn {
            // if not logged in, display a button
            Button {
                // show the login form - bound to the .sheet
                loginFormShowing = true
                
            } label: {
                Text("Sign In or Create Account")
            }
            // can use onDismiss to run checkLogin to update the view.  kind of like a callback
            .sheet(isPresented: $loginFormShowing, onDismiss: { checkLogin() } ) {
                LoginForm()
            }
            .onAppear {
                checkLogin()
            }
        }
        else {
            
            // Show the logged in view
            ContentView(loggedIn: $loggedIn)
        }
        
      
    }
    
    func checkLogin() {
        
        // gets the currentUser, sets loggedin
        loggedIn = FUIAuth.defaultAuthUI()?.auth?.currentUser == nil ? false : true
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
