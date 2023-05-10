//
//  LoginForm.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/9/23.
//

import SwiftUI
import FirebaseAuth

struct LoginForm: View {
    
    // needs to be passed in
    @Binding var formShowing: Bool
    
    // private as it doesn't need to travel
    @State private var email: String = ""
    @State private var password: String = ""
    // make it optional nil to start. only display if it exists
    @State private var errorMessage: String?
    
    var body: some View {
        
        // wrap form in a NavView
        NavigationView {
            Form {
                // use Section to separate the Sign In button from the rest of the Form
                Section {
                    TextField("Email", text: $email)
                    // use SecureField so letters don't show as i type
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }


                Button {
                    // perform login
                    signIn()
                } label: {
                    // default is left aligned
                    // to center, drop in HStack and spacer
                    HStack {
                        Spacer()
                        Text("Sign in")
                        Spacer()
                    }

                }

            }
            .navigationTitle("Sign In")
        }
        
        
    }
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            // open up this closure with a completion handler
            
            // NEED to update it in the main thread, b/c we don't want to trigger any UI updates in the background thread
            DispatchQueue.main.async {
                if error != nil {
                    // Oh no! Dismiss this sheet
                    errorMessage = error?.localizedDescription
                }
                else {
                    // no errors - dismiss the sheet, show the content view
                    formShowing = false
                }
            }
            
        }
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        // It wants a binding, so you can't just pass in 'true'
        LoginForm(formShowing: Binding.constant(true))
    }
}
