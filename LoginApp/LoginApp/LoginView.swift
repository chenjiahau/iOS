//
//  ContentView.swift
//  LoginApp
//
//  Created by Ivan on 2024/10/21.
//

import SwiftUI

struct LoginError {
    var account: String = ""
    var password: String = ""
    
    mutating func changeAccountMessage(message: String) {
        self.account = message
    }
    
    mutating func changePasswordMessage(message: String) {
        self.password = message
    }
}

struct LoginView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var accountIsDirty: Bool = false
    @State private var passwordIsDirty: Bool = false
    @State private var loginError = LoginError()
    
    func clearLoginError() {
        loginError = LoginError()
    }
    
    var isFormValid: Bool {
        DispatchQueue.main.async {
            clearLoginError()
        }

        if account.isEmpty || account.count < 8 || account.count > 64 {
            DispatchQueue.main.async {
                loginError.changeAccountMessage(message: "Invalid account")
            }

            return false
        }

        if !checkEmail(email: account) {
            DispatchQueue.main.async {
                loginError.changeAccountMessage(message: "Invalid account")
            }

            return false
        }

        if password.isEmpty || password.count < 8 || password.count > 64 {
            DispatchQueue.main.async {
                loginError.changePasswordMessage(message: "Invalid password")
            }

            return false
        }

        return true
    }
    
    var body: some View {
        Form {
            TextField("Account", text: $account)
                .textInputAutocapitalization(.never)
                .onChange(of: account) { oldValue, newValue in
                    accountIsDirty = true
                }
            if (accountIsDirty && !loginError.account.isEmpty) {
                Text(loginError.account)
                    .foregroundStyle(.red)
            }
            SecureField("Password", text: $password)
                .onChange(of: password) { oldValue, newValue in
                    passwordIsDirty = true
                }
            if (passwordIsDirty && !loginError.password.isEmpty) {
                Text(loginError.password)
                    .foregroundStyle(.red)
            }
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
