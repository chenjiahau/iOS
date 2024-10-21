//
//  ContentView.swift
//  LoginApp
//
//  Created by Ivan on 2024/10/21.
//

import SwiftUI

enum LoginError: LocalizedError, Identifiable {
    case account
    case password

    var id: Int {
        hashValue
    }
    
    var errorDescription: String? {
        switch self {
        case .account:
            return "Invalid account"
        case .password:
            return "Invalid password"
        }
    }
}

struct LoginView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var isAccountDirty: Bool = false
    @State private var isPasswordDirty: Bool = false
    @State private var loginErrors: [LoginError] = []
    
    func clearLoginError() {
        loginErrors = []
    }
    
    var isFormValid: Bool {
        DispatchQueue.main.async {
            clearLoginError()
        }

        if isAccountDirty && (account.isEmpty || account.count < 8 || account.count > 64) {
            DispatchQueue.main.async {
                loginErrors.append(.account)
            }

            return false
        }

        if isAccountDirty && !checkEmail(email: account) {
            DispatchQueue.main.async {
                loginErrors.append(.account)
            }

            return false
        }

        if isPasswordDirty && (password.isEmpty || password.count < 8 || password.count > 64) {
            DispatchQueue.main.async {
                loginErrors.append(.password)
            }

            return false
        }

        return true
    }
    
    var body: some View {
        Form {
            ForEach(loginErrors) { loginError in
                Text(loginError.localizedDescription)
                    .foregroundStyle(.red)
            }
            TextField("Account", text: $account)
                .textInputAutocapitalization(.never)
                .onChange(of: account) { oldValue, newValue in
                    isAccountDirty = true
                }
            SecureField("Password", text: $password)
                .onChange(of: password) { oldValue, newValue in
                    isPasswordDirty = true
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
