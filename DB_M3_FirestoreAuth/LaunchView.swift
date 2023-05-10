//
//  LaunchView.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/7/23.
//

import SwiftUI
import FirebaseAuth

struct LaunchView: View {
    
    @State var loggedIn = false
    @State var loginFormShowing = false
    @State var createFormShowing = false
    
    var body: some View {
        

        
        // Check the logged in property and show the appropriate view
        if !loggedIn {
            
            VStack(spacing: 20) {
                // if not logged in, display a Sign in button
                Button {
                    // onTap, show the login form - bound to the .sheet
                    loginFormShowing = true
                    
                } label: {
                    VStack {
                        Text("Sign In or Create Account")
                        Text("Custom Auth UI")
                    }
                }
                // can use onDismiss to run checkLogin to update the view.  kind of like a callback
                .sheet(isPresented: $loginFormShowing, onDismiss: { checkLogin() } ) {
                    LoginForm(formShowing: $loginFormShowing)
                }
                
                // Create account button
                Button {
                    createFormShowing = true
                } label: {
                    Text("Create Account")
                }
                // don't need to add () to checkLogin.  cool
                .sheet(isPresented: $createFormShowing, onDismiss: checkLogin) {
                    CreateAccount(formShowing: $createFormShowing)
                }

            }
            .onAppear {
                checkLogin()
                // apply the .onAppear on the VStack now, instead of the Button (now that we have the createUser option
            }
        }
        else {
            
            // Show the logged in view
            ContentView(loggedIn: $loggedIn)
        }
        
      
    }
    
    func checkLogin() {
        
        // gets the currentUser, sets loggedin
        //loggedIn = FUIAuth.defaultAuthUI()?.auth?.currentUser == nil ? false : true
        
        // CUSTOM UI call
        loggedIn = Auth.auth().currentUser == nil ? false : true
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
