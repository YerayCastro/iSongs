//
//  MovieSectionView.swift
//  iSongs
//
//  Created by Yery Castro on 22/5/24.
//

import SwiftUI

struct MovieSectionView: View {
    let movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 0) {
                ForEach(movies) { movie in
                    VStack(alignment: .leading) {
                        ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
                        Text(movie.trackName)
                        Text(movie.primaryGenreName)
                            .foregroundStyle(.gray)
                    }
                    .font(.caption)
                    .lineLimit(2)
                    .frame(width: 80)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    MovieSectionView(movies: [Movie.example()])
}
