//
//  LoginErrorsView.swift
//  LoginApp
//
//  Created by Ivan on 2024/10/21.
//

import SwiftUI

struct LoginErrorsView: View {

    let loginErrors: [LoginError]

    var body: some View {
        ForEach(loginErrors, id: \.id) { loginError in
            Text(loginError.localizedDescription)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    LoginErrorsView(loginErrors: [])
}
