//
//  SearchResultsViewModel.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Alamofire

class SearchResultsViewModel {
    
    var searchString = ""
    private var usersResult: SearcAPIResult?

    var count: Int {
        return usersResult?.results.count ?? 0
    }
    
    func search(completion: @escaping (Result<SearcAPIResult, Error>) -> Void) {
        SearchAPI.search(searchString) { [weak self] apiResponse in
            guard let self = self else { return }
            guard apiResponse.response?.statusCode == 200 else {
                let errorMessage = apiResponse.value?.errorMessage ?? "Unknown Error"
                completion(.failure(errorMessage))
                return
            }
            switch apiResponse.result {
            case .success(let result):
                self.usersResult = result
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func createSearchViewModel(from index: Int) -> SearchResultDetailViewModel? {
        guard let results = usersResult?.results, results.indices.contains(index) else { return nil }
        return SearchResultDetailViewModel(result: results[index])
    }
    
}
