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
        return "\(result.trackPrice)"
    }
    
    var cellGenre: String {
        return result.primaryGenreName.rawValue
    }
    
    var cellArtWork: URL? {
        return URL(string: result.artworkUrl60)
    }
}
