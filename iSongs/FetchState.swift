//
//  FetchState.swift
//  iSongs
//
//  Created by Yery Castro on 21/5/24.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
