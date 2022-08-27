//
//  LogInView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-26.
//

import SwiftUI

struct LogInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                    
                Spacer()
                Button(action: {print("Sign Up")}) { //TODO
                    Text("Sign Up")
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
                        "Email",
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
            
            VStack {
                Button(action: ({print("Log In Successful!")})) { //TODO
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .frame(height: 50)
                            .foregroundColor(.GreenPrimary)

                        Text("Log In")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                }
            
                Button(action: ({print("Forget password")})) { //TODO
                    Text("Forgot your password?")
                        .fontWeight(.semibold)
                        .foregroundColor(.GreenPrimary)
                        .padding(.top, 10.0)
                }
            }
        }
        .padding(.all)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
