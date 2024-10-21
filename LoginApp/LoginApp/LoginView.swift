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
        if (account.isEmpty || account.count < 8 || account.count > 64) {
            return false
        }
        
        if (!checkEmail(email: account)) {
            return false
        }

        if (password.isEmpty || password.count < 8 || password.count > 64) {
            return false
        }
        
        return true
    }
    
    var body: some View {
        Form {
            TextField("Account", text: $account)
                .textInputAutocapitalization(.never)
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
