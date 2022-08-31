//
//  ManageLogInAndSignUpView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-29.
//

import SwiftUI

//We can't remove extra spaces from NavigationView even if it's hidden, so I created the new view to manage it without NavigationView at all

struct ManageLogInAndSignUpView: View {
    @State var LogInClicked = false
    
    var body: some View {
        if LogInClicked {
            LogInView(LogInClicked: $LogInClicked)
        } else {
            SignUpView(LogInClicked: $LogInClicked)
        }
    }
}

struct ManageLogInAndSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ManageLogInAndSignUpView()
    }
}
