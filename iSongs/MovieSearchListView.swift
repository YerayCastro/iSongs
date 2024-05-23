//
//  MovieListView.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import SwiftUI

struct MovieSearchListView: View {
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Movies")
        }
    }

}

#Preview {
    MovieSearchListView()
}
