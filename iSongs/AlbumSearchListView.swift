//
//  AlbumSearchView.swift
//  iSongs
//
//  Created by Yery Castro on 20/5/24.
//

import SwiftUI

struct AlbumSearchListView: View {
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}

#Preview {
    AlbumSearchListView()
}
