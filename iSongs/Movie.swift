//
//  Movie.swift
//  iSongs
//
//  Created by Yery Castro on 20/5/24.
//

import Foundation

// MARK: - MovieResult
struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    let wrapperType: String
    let kind: String
    let artistID: Int?
    let trackID: Int
    let artistName: String
    let trackName: String
    let trackCensoredName: String
    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String?
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
    let collectionPrice: Double?
    let trackPrice: Double?
    let trackRentalPrice: Double?
    let collectionHDPrice: Double?
    let trackHDPrice: Double?
    let trackHDRentalPrice: Double?
    let releaseDate: String
    let collectionExplicitness: String
    let trackExplicitness: String
    let trackTimeMillis: Int?
    let country: String
    let currency: String
    let primaryGenreName: String
    let contentAdvisoryRating: String
    let shortDescription: String?
    let longDescription: String?
    var id: Int {
        return trackID
    }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case trackID = "trackId"
        case artistName, trackName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
    }
    
    static func example() -> Movie {
        Movie(wrapperType: "track", kind: "feature-movie", artistID: 1, trackID: 2, artistName: "Jack Johnson",
              trackName: "All At Once: On the Road Tour Documentary",
              trackCensoredName: "", artistViewURL: nil, trackViewURL: "", previewURL: nil,
              artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video3/v4/80/1d/47/801d4725-5070-1e2a-ab32-dbb240ee8390/UMG_vidcvr_00602547849786_01_RGB72_1400x2100_16UMGIM10177.jpg/100x100bb.jpg",
              collectionPrice: 7.99, trackPrice: 7.99, trackRentalPrice: 3.99, collectionHDPrice: nil, trackHDPrice: nil, trackHDRentalPrice: nil, releaseDate: "2016-04-08T07:00:00Z", collectionExplicitness: "", trackExplicitness: "", trackTimeMillis: 2472388, country: "USA", currency: "USD",
              primaryGenreName: "Concert Films",
              contentAdvisoryRating: "", shortDescription: "This film takes an intimate look at Jack Johnson’s music and tour greening initiatives. When Jack", longDescription: "This film takes an intimate look at Jack Johnson’s music and tour greening initiatives. When Jack goes on the road, he doesn’t just show up and play music. The tour partners with local non-profits, local food vendors and strives to leave a lasting positive impact. The entire tour is an extension of the environmentally conscious and socially engaged life he leads along with his wife, Kim. After years on the road, playing venues around the globe, the Johnson’s have established an inspiring way of touring with a focus on creating as little impact on the earth as possible. Along the way, the tour gives a platform to dozens of local non-profits working to educate and inspire others to make choices that benefit our communities and the greater global environment. While following Jack’s 2014 west coast tour, this film highlights the Johnson‘s Kokua Hawaii Foundation, the All At Once campaign, and several non-profit partners and businesses focusing on plastic free initiatives and sustainable local food systems. Additionally, the film highlights the unique way in which tour is run. From traveling on biodiesel-powered buses, to sourcing organic and locally grown meals to carefully disposing of waste created along the way. The goal of the tour and this documentary is to inspire people to get involved, make the right choices, and enjoy the music along the way.")
    }
}
