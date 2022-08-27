//
//  SignUpView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-25.
//

import SwiftUI

struct SignUpView: View {
    @State private var nameComponents = PersonNameComponents()
    @State private var username: String = ""
   // @FocusState private var emailFieldIsFocused: Bool = false
    @State private var password: String = ""
    @State private var showPassword = false
    @State private var agreeAds = false

    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                    
                Spacer()
                Button(action: {print("Log In")}) { //TODO
                    Text("Log In")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.GreenPrimary)
                }
            }
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Gray01)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.Gray02, lineWidth: 1)
                }
                .frame(height: 50.0)
                    
                TextField (
                        "John Smith",
                        value: $nameComponents,
                        format: .name(style: .medium)
                )
                .padding(.all)
                .disableAutocorrection(true)
            }
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Gray01)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.Gray02, lineWidth: 1)
                }
                .frame(height: 50.0)
                    
                TextField(
                    "example@mail.com",
                    text: $username
                )
                .padding(.all)
                .disableAutocorrection(true)
            }
            
            ZStack {
                Group {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Gray01)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.Gray02, lineWidth: 1)
                }
                .frame(height: 50.0)
                    
                HStack {
                    if !showPassword {
                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        }
                    else {
                        TextField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    Button(action: {showPassword.toggle()}, label: {
                        Text(self.showPassword ? "Hide" : "Show")
                            .fontWeight(.medium)
                            .foregroundColor(.GreenPrimary)
                    })
                }
                .padding(.all)
            }
            Toggle(isOn: $agreeAds) {
                Text("I would like to receive your newsletter.")
                    .foregroundColor(.Gray04)
            }
            .toggleStyle(CheckBoxStyle())
            
            Button(action: ({print("Sign Up Successful!")})) { //TODO
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .frame(height: 50)
                        .foregroundColor(.GreenPrimary)

                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.top)
            }
        }
        .padding(.all)
    }
}




struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
