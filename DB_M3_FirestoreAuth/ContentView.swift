//
//  ContentView.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/6/23.
//

import SwiftUI
// import these two instead of FirebaseUI
import FirebaseAuth
import Firebase


struct ContentView: View {
    
    // this veiw Will show when loggedin = true
    
    // normally would be holding this in the ViewModel Published props, but this is fine for the demo
    @Binding var loggedIn: Bool
    
    // Initialize to an empty string
    @State private var firstname: String = ""
    
    
    var body: some View {
        
        VStack (spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! - Custom Auth")
            // It's a navigation controller, so onTap it goes to another form - serves the login flow, yay!
            //LoginForm()
            
            TextField("Change Name", text: $firstname)
            Button(action: {
                // cleanse the data, then save to the DB
                saveFirstName()
            }, label: {
                Text("Save")
            })
            
            Button {
                // could be DANGEROUS! but OK for demo purposes
                // CANNED UI call
                //try! FUIAuth.defaultAuthUI()?.signOut()
                // when you hit Sign Out, it clears the currentUser
                
                // triggers the view update to bring us back to the loginForm
                
                // CUSTOM UI call
                try! Auth.auth().signOut()
                loggedIn = false
            } label: {
                Text("Sign Out")
            }
        }
        .padding()
    }
    
    // In real life this function is part of the create new account form
    func saveFirstName() {
        
        // As long as there is a currentUser, proceed
        if let currentUser = Auth.auth().currentUser {
            // A pretty sweet way to clean up data input
            let cleansedFirstName = firstname.trimmingCharacters(in: .whitespacesAndNewlines)
                let db = Firestore.firestore()
                
                // no need to unwrap, checked above with the if let
                let path = db.collection("users").document(currentUser.uid)
                path.setData(["firstname": cleansedFirstName]) { error in
                    
                    // TODO: why is there no result needed, next to the error above "(result, error) in"
                    
                    if error == nil {
                        // Saved successfully!
                    }
                    else {
                        // error
                        print("setData to firestore failed")
                    }
                }
            }
    }
}

//struct ContentView_Previews: PreviewProvider {

    // TODO: fix preview
//    static var previews: some View {
//        ContentView(loggedIn: $false)
//    }
//}
