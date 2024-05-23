//
//  BuyButtonStyle.swift
//  iSongs
//
//  Created by Yery Castro on 22/5/24.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.blue)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.blue ,lineWidth: 1.0))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

#Preview {
    VStack {
        Button("1.99 USD") {
            
        }
        .buttonStyle(BuyButtonStyle())
    }
}
