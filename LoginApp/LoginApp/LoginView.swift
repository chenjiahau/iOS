//
//  ContentView.swift
//  LoginApp
//
//  Created by Ivan on 2024/10/21.
//

import SwiftUI

struct LoginView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    
    var isFormValid: Bool {
        return !account.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Account", text: $account)
            SecureField("Password", text: $password)
            Button("Sign in") {
                print("Your account is \(account)")
                print("Your password is \(password)")
            }
            .disabled(!isFormValid)
        }
    }
}

#Preview {
    LoginView()
}
