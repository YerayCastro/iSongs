//
//  ContentView.swift
//  iSongs
//
//  Created by Yery Castro on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            AlbumSearchListView()
                .tabItem { Label("Albums", systemImage: "music.note") }
            
            MovieSearchListView()
                .tabItem { Label("Movies", systemImage: "tv") }
        }
    }
}

#Preview {
    ContentView()
}
