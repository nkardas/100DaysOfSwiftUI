//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Némo Kardassevitch on 06/11/2024.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            VStack{
                content
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Large, blue font suitable for prominent titles")
            .titleStyle()
    }
}

#Preview {
    ContentView()
}
