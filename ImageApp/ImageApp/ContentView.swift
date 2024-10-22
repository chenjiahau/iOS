//
//  ContentView.swift
//  ImageApp
//
//  Created by Ivan on 2024/10/22.
//

import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 128)
      .foregroundColor(.purple)
      .opacity(0.5)
  }
}

struct ContentView: View {
    private let imageURL: String = "https://img.uxcel.com/tags/ios-1721717446446-2x.jpg"
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            if let image = phase.image {
                image
                    .imageModifier()
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
    }
}

#Preview {
    ContentView()
}
