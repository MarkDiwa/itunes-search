//
//  SearcAPIResult.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Foundation

// MARK: - SearchResult
struct SearcAPIResult: Codable {
    var resultCount: Int
    var results: [SearchResult]
    var errorMessage: String
}

// MARK: - Result
struct SearchResult: Codable {
    var wrapperType: String
    var kind: String
    var collectionID: Int?
    var trackID: Int
    var artistName: String
    var collectionName: String?
    var trackName: String
    var collectionCensoredName: String?
    var trackCensoredName: String
    var collectionArtistID: Int?
    var collectionArtistViewURL, collectionViewURL: String?
    var trackViewURL: String
    var previewURL: String
    var artworkUrl30, artworkUrl60, artworkUrl100: String
    var collectionPrice, trackPrice: Double
    var trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    var releaseDate: Date
    var collectionExplicitness: String
    var trackExplicitness: String
    var discCount, discNumber, trackCount, trackNumber: Int?
    var trackTimeMillis: Int
    var country: String
    var currency: String
    var primaryGenreName: PrimaryGenreName
    var contentAdvisoryRating: ContentAdvisoryRating
    var shortDescription: String?
    var longDescription: String
    var hasITunesExtras: Bool = false

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate
        case collectionExplicitness
        case trackExplicitness
        case discCount
        case  discNumber
        case trackCount
        case trackNumber
        case trackTimeMillis
        case  country
        case  currency
        case  primaryGenreName
        case  contentAdvisoryRating
        case  shortDescription
        case  longDescription
        case  hasITunesExtras
    }
}

enum ContentAdvisoryRating: String, Codable {
    case ratedG = "G"
    case ratedM = "M"
    case ratedMA15 = "MA15+"
    case ratedPG = "PG"
}

enum PrimaryGenreName: String, Codable {
    case actionAdventure = "Action & Adventure"
    case comedy = "Comedy"
    case drama = "Drama"
    case kidsFamily = "Kids & Family"
    case romance = "Romance"
    case sciFiFantasy = "Sci-Fi & Fantasy"
    case sports = "Sports"
}

extension SearcAPIResult {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultCount = try container.decode(forKey: .resultCount, defaultValue: 0)
        self.results = try container.decode(forKey: .results, defaultValue: [])
        self.errorMessage = try container.decode(forKey: .errorMessage, defaultValue: "")
    }
}

extension KeyedDecodingContainer {
    func decode<T>(forKey key: K, defaultValue: T) throws -> T
        where T: Decodable {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
