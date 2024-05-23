//
//  SongsForAlbumListView.swift
//  iSongs
//
//  Created by Yery Castro on 22/5/24.
//

import SwiftUI

struct SongsForAlbumListView: View {
    @ObservedObject var songsViewModel: SongsForAlbumListViewModel
    let selectedSong: Song?
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                if songsViewModel.state == .isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    SongGridView(songs: songsViewModel.songs, selectedSong: selectedSong)
                        .onAppear {
                            proxy.scrollTo(selectedSong?.trackNumber, anchor: .center)
                        }
                }
            }
        }
    }
    
    
    
    struct SongGridView: View {
        let songs: [Song]
        let selectedSong: Song?
        
        var body: some View {
            Grid(horizontalSpacing: 20) {
                ForEach(songs) { song in
                    GridRow {
                        Text("\(song.trackNumber)")
                            .font(.footnote)
                            .gridColumnAlignment(.trailing)
                        Text(song.trackName)
                            .gridColumnAlignment(.leading)
                        Spacer()
                        Text(formattedDuration(time: song.trackTimeMillis))
                            .font(.footnote)
                        BuySongButton(urlString: song.previewURL,
                                      price: song.trackPrice,
                                      currency: song.currency)
                        
                    }
                    .foregroundStyle(song == selectedSong ? Color.accentColor : Color(.label))
                    .id(song.trackNumber)
                    Divider()
                }
            }
            .padding([.vertical, .leading])
        }
        
        func formattedDuration(time: Int) -> String {
            let timeInSecond = time / 1000
            let interval = TimeInterval(timeInSecond)
            let formatted = DateComponentsFormatter()
            formatted.zeroFormattingBehavior = .pad
            formatted.allowedUnits = [.minute, .second]
            formatted.unitsStyle = .positional
            
            return formatted.string(from: interval) ?? ""
        }
    }
}

#Preview {
    SongsForAlbumListView(songsViewModel: SongsForAlbumListViewModel.example(), selectedSong: nil)
}
