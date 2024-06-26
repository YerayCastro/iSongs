//
//  SearchAllListView.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import SwiftUI

struct SearchAllListView: View {
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                HStack {
                    Text("Songs")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        SongListView(viewModel: songListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(.horizontal)
                
                SongSectionView(songs: songListViewModel.songs)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Albums")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        AlbumListView(viewModel: albumListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(.horizontal)
                
                AlbumSectionView(albums: albumListViewModel.albums)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Movies")
                        .font(.title2)
                    Spacer()
                    NavigationLink {
                        MovieListView(viewModel: movieListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding(.horizontal)
                
                MovieSectionView(movies: movieListViewModel.movies)
                    
            }
        }
    }
}

#Preview {
    SearchAllListView(albumListViewModel: AlbumListViewModel.example(),
                      songListViewModel: SongListViewModel.example(),
                      movieListViewModel: MovieListViewModel.example())
}
