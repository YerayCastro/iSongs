//
//  SongsForAlbumViewModel.swift
//  iSongs
//
//  Created by Yery Castro on 22/5/24.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    let albumID: Int
    @Published var songs = [Song]()
    @Published var state: FetchState = .good
    
    let service = APIService()
    
    init(albumID: Int) {
        self.albumID = albumID
        
    }
    
    func fetch() {
        fetchSongs(for: albumID)
    }
    
    private func fetchSongs(for albumID: Int) {
        service.fetchSongs(for: albumID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    var songs = results.results
                    if results.resultCount > 0 {
                        _ = songs.removeFirst()
                    }
                    self?.songs = songs.sorted(by: { $0.trackNumber < $1.trackNumber })
                    self?.state = .good
                    print("fetched \(results.resultCount) songs for albumID: \(albumID)")
                case .failure(let error):
                    print("Could not load: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> SongsForAlbumListViewModel {
        let vm = SongsForAlbumListViewModel(albumID: 1)
        vm.songs = [Song.example(), Song.example2()]
        return vm
    }
}
