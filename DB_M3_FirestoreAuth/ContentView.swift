//
//  ContentView.swift
//  DB_M3_FirestoreAuth
//
//  Created by tom montgomery on 5/6/23.
//

import SwiftUI
// import these two instead of FirebaseUI
import FirebaseAuthUI
import FirebaseEmailAuthUI

struct ContentView: View {
    
    // this veiw Will show when loggedin = true
    
    // normally would be holding this in the ViewModel Published props, but this is fine for the demo
    @Binding var loggedIn: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            // It's a navigation controller, so onTap it goes to another form - serves the login flow, yay!
            //LoginForm()
            Button {
                // could be DANGEROUS! but OK for demo purposes
                try! FUIAuth.defaultAuthUI()?.signOut()
                // when you hit Sign Out, it clears the currentUser
                
                // triggers the view update to bring us back to the loginForm
                loggedIn = false
            } label: {
                Text("Sign Out")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
