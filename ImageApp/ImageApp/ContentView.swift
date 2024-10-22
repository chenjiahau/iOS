//
//  ContentView.swift
//  ImageApp
//
//  Created by Ivan on 2024/10/22.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://img.uxcel.com/tags/ios-1721717446446-2x.jpg"
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill")
                    .frame(maxWidth: 128)
                    .foregroundColor(.purple)
                    .opacity(0.5)
            } else {
                Image(systemName: "photo.circle.fill")
                    .frame(maxWidth: 128)
                    .foregroundColor(.purple)
                    .opacity(0.5)
            }
        }
    }
}

#Preview {
    ContentView()
}
