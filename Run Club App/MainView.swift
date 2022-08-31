//
//  ContentView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ManageLogInAndSignUpView()
                .tabItem {
                    Label("Home", systemImage: "house")
                     }
            
            HealthKitTest()
                .tabItem {
                    Label("Health", systemImage: "figure.run")
                }

            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "person.3.fill")
                     }
                 
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(.GreenPrimary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
