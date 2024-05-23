//
//  SongDetailView.swift
//  iSongs
//
//  Created by Yery Castro on 23/5/24.
//

import SwiftUI

struct SongDetailView: View {
    let song: Song
    
    @StateObject var songsViewModel: SongsForAlbumListViewModel
    @StateObject var albumViewModel = AlbumForSongViewModel()
    
    init(song: Song) {
        self.song = song
        self._songsViewModel = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: song.collectionID))
    }
    
    var body: some View {
        VStack {
            if let album = albumViewModel.album {
                AlbumHeaderDetailView(album: album)
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            SongsForAlbumListView(songsViewModel: songsViewModel, selectedSong: song)
        }
        .onAppear {
            songsViewModel.fetch()
            albumViewModel.fetch(song: song)
        }
    }
}

#Preview {
    SongDetailView(song: Song.example())
}
