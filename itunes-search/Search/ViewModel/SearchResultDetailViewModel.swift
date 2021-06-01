//
//  SearchResultDetailViewModel.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Foundation

class SearchResultDetailViewModel {
    
    private var result: SearchResult
    
    init(result: SearchResult) {
        self.result = result
    }
    
    var cellTrackName: String {
        return result.trackName
    }
    
    var cellPrice: String {
        return "\(result.trackPrice ?? 0) \(result.currency)"
    }
    
    var cellGenre: String {
        return "\(result.primaryGenreName)-\(result.contentAdvisoryRating)"
    }
    
    var cellArtWork: URL? {
        return URL(string: result.artworkUrl60)
    }
    
    var detailTitle: String {
        return result.trackName
    }
    
    var detailDirector: String {
        return "Director: \(result.artistName)"
    }
    
    var detailGenre: String {
        return "Genre: \(result.primaryGenreName)"
    }
    
    var detailTrackUrl: String {
        return "URL: \(result.trackViewURL)"
    }
    
    var detailDescription: String {
        return result.longDescription
    }
    
    var detailArtwork: URL? {
        return URL(string: result.artworkUrl100)
    }
}
