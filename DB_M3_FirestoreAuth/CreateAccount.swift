//
//  CreateAccount.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/9/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccount: View {
    
    @Binding var formShowing: Bool
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    TextField("Email", text: $email)
                    TextField("Name", text: $name)
                    SecureField("Password", text: $password)
                }
                
                if errorMessage != nil {
                    Section {
                        Text(errorMessage!)
                    }
                }
                
                Button {
                    // perform createUser
                    createNewAccount()
                } label: {
                    HStack {
                        Spacer()
                        Text("Create User")
                        Spacer()
                    }

                }

            }
            .navigationTitle("Create an Account")
        }
    }
    
    func createNewAccount() {
        
        Auth.auth().createUser(withEmail: email, password: password) {
            // add completion handler / callback
            result, error in
            
            // Making UI updates - must happen in the main thread
            DispatchQueue.main.async {
                if error != nil {
                    // oh geez, it failed
                    errorMessage = error!.localizedDescription
                }
                else {
                    // good account creation - dismiss the form
                    formShowing = false
                }
            }
           
        }
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount(formShowing: Binding.constant(true))
    }
}
