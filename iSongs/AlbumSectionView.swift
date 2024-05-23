//
//  AlbumSectionView.swift
//  iSongs
//
//  Created by Yery Castro on 22/5/24.
//

import SwiftUI

struct AlbumSectionView: View {
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(albums) { album in
                    VStack(alignment: .leading) {
                        ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                        Text(album.collectionName)
                        Text(album.artistName)
                            .foregroundStyle(.gray)
                    }
                    .font(.caption)
                    .lineLimit(2)
                    .frame(width: 100)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    AlbumSectionView(albums: [Album.example()])
}
