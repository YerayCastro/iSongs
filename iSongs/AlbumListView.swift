//
//  AlbumListView.swift
//  iSongs
//
//  Created by Yery Castro on 20/5/24.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
            List {
                ForEach(viewModel.albums) { album in
                    NavigationLink {
                        AlbumDetailView(album: album)
                    } label: {
                        AlbumRowView(album: album)
                    }
                }
                
                switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                case .loadedAll:
                    EmptyView()
                case .error(let message):
                    Text(message)
                        .foregroundStyle(.red)
                }
                
            }
            .listStyle(.plain)
        
    }
}

#Preview {
    NavigationStack {
        AlbumListView(viewModel: AlbumListViewModel.example())
    }
}
