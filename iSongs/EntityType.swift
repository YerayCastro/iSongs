//
//  EntityType.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case all
    case album
    case song
    case movie
    
    var id: String {
        self.rawValue
    }
    
    func name() -> String {
        switch self {
        case .all:
            "All"
        case .album:
            "Albums"
        case .song:
            "Songs"
        case .movie:
            "Movies"
        }
    }
}
