//
//  SearchAPI.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Alamofire

enum SearchRequest: RequestConvertible {
    
    case search(_ term: String, country: String, media: String, limit: Int)
    
    var path: String {
        let searchPath = "/search"
        switch self {
        case .search:
            return searchPath
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var parameters: Parameters? {
        var params: Parameters?
        switch self {
        case let .search(term, country, media, limit):
            params = ["term": term,
                      "country": country,
                      "media": media,
                      "limit": limit]
        }
        return params
    }
    
}

enum SearchAPI {

    static func search(_ term: String,
                       country: String = "au",
                       media: String = "movie",
                       limit: Int = 50,
                       completion:  @escaping (AFDataResponse<SearchResult>) -> Void) {
        AF.request(SearchRequest.search(term,
                                        country: country,
                                        media: media,
                                        limit: limit)).responseDecodable(of: SearchResult.self,
                                                                         completionHandler: completion)
    }
}
