//
//  SearchResultDetailViewModel.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Foundation

/// I Decided to use MVVM pattern because from what I know. This is the pattern that is widely used by developers. But to be honest MVC is what our team currently use.
class SearchResultDetailViewModel {
    
    private var result: SearchResult
    
    init(result: SearchResult) {
        self.result = result
    }
    
    // MARK: - Cell
    
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
    
    // MARK: - Detail
    
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
