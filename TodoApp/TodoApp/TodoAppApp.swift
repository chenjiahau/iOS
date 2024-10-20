//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Ivan on 2024/10/17.
//

import SwiftUI

@main
struct TodoAppApp: App {

    @StateObject private var store = Store()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
