//
//  SearchPlaceholderView.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import SwiftUI

struct SearchPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = [
        "rammstein",
        "cry to me",
        "maneskin"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Trending")
                .font(.title)
            ForEach(suggestions, id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                        .font(.title2)
                }
            }
        }
    }
}

#Preview {
    SearchPlaceholderView(searchTerm: .constant("Jonh"))
}
