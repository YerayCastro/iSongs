//
//  MovieListViewModel.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import Foundation
import Combine

final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = [Movie]()
    @Published var searchTerm: String = ""
    @Published var state: FetchState = .good
    
    private let service = APIService()
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.state = .good
                self?.movies = []
                self?.fetchMovies(for: term)
        }.store(in: &subscriptions)
    }
    
    func loadMore() {
        fetchMovies(for: searchTerm)
    }
    
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else { return }
        
        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.movies = results.results
    
                    
                    self?.state = .good
                case .failure(let error):
                    print("Could not load: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> MovieListViewModel {
        let vm = MovieListViewModel()
        vm.movies = [Movie.example()]
        return vm
    }
}
