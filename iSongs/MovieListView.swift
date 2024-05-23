//
//  MovieListView.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
            List {
                ForEach(viewModel.movies) { movie in
                    MovieRowView(movie: movie)
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
    MovieListView(viewModel: MovieListViewModel.example())
}
