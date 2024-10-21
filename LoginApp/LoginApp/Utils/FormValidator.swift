//
//  FormValidator.swift
//  LoginApp
//
//  Created by Ivan on 2024/10/21.
//

import Foundation

func checkEmail(email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

    return emailPredicate.evaluate(with: email)
}
