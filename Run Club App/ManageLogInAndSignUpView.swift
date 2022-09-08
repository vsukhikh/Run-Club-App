//
//  ManageLogInAndSignUpView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-29.
//

import SwiftUI

//We can't remove extra spaces from NavigationView even if it's hidden, so I created the new view to manage it without NavigationView at all.

struct ManageLogInAndSignUpView: View {
    @State var LogInClicked = false
    @StateObject var AuthViewModel = AuthenticationViewModel()
    
    var body: some View {
        if LogInClicked {
            LogInView(LogInClicked: $LogInClicked)
                .environmentObject(AuthViewModel)
        } else {
            SignUpView(LogInClicked: $LogInClicked)
                .environmentObject(AuthViewModel)
        }
    }
}

struct ManageLogInAndSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ManageLogInAndSignUpView()
    }
}
