//
//  SearchView.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    @State private var selectedEntityType = EntityType.all
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Divider()
                
                
                if searchTerm.count == 0 {
                    SearchPlaceholderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity)
                } else {
                    
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumListViewModel,
                                          songListViewModel: songListViewModel,
                                          movieListViewModel: movieListViewModel)
                    case .album:
                        AlbumListView(viewModel: albumListViewModel)
                    case .song:
                        SongListView(viewModel: songListViewModel)
                    case .movie:
                        MovieListView(viewModel: movieListViewModel)
                    }
                }
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Search")
        }
        .onChange(of: selectedEntityType, { oldValue, newValue in
            updateViewModels(for: searchTerm, selectedEntityType: newValue)
        })
        .onChange(of: searchTerm) { oldValue, newValue in
            updateViewModels(for: newValue, selectedEntityType: selectedEntityType)
        }
    }
    
    func updateViewModels(for searchTerm: String, selectedEntityType: EntityType) {
        switch selectedEntityType {
        case .all:
            albumListViewModel.searchTerm = searchTerm
            songListViewModel.searchTerm = searchTerm
            movieListViewModel.searchTerm = searchTerm
        case .album:
            albumListViewModel.searchTerm = searchTerm
            songListViewModel.searchTerm = ""
            movieListViewModel.searchTerm = ""
        case .song:
            songListViewModel.searchTerm = searchTerm
            albumListViewModel.searchTerm = ""
            movieListViewModel.searchTerm = ""
        case .movie:
            movieListViewModel.searchTerm = searchTerm
            songListViewModel.searchTerm = ""
            albumListViewModel.searchTerm = ""
        }
    }
}

#Preview {
    SearchView()
}
