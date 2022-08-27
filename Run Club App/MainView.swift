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
            SignUpView()
                .tabItem {
                    Label("Home", systemImage: "person")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
