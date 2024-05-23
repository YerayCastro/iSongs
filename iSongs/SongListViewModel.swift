//
//  SongListViewModel.swift
//  iSongs
//
//  Created by Yery Castro on 20/5/24.
//

import Foundation
import Combine

final class SongListViewModel: ObservableObject {
    @Published var songs: [Song] = [Song]()
    @Published var searchTerm: String = ""
    @Published var state: FetchState = .good
    
    private let service = APIService()
    var subscriptions = Set<AnyCancellable>()
    
    let limit: Int = 20
    var page: Int = 0
    
    init() {
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.clear()
                self?.fetchSongs(for: term)
        }.store(in: &subscriptions)
    }
    
    func clear() {
        state = .good
        songs = []
        page = 0
    }
    
    func loadMore() {
        fetchSongs(for: searchTerm)
    }
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else { return }
        
        state = .isLoading
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for song in results.results {
                        self?.songs.append(song)
                    }
                    self?.page += 1
                    
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                case .failure(let error):
                    print("Could not load: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> SongListViewModel {
        let vm = SongListViewModel()
        vm.songs = [Song.example()]
        return vm
    }
}
