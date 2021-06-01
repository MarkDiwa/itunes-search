//
//  SearchResultsViewModel.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Alamofire

class SearchResultsViewModel {
    
    var searchString = ""
    private var usersResult: SearchResult?
    private var results: [Result] = []

    var count: Int {
        return results.count
    }
    
    func createSearchViewModel(from index: Int) -> SearchResultDetailViewModel? {
        guard results.indices.contains(index) else { return nil }
        return SearchResultDetailViewModel(result: results[index])
    }
    
}
