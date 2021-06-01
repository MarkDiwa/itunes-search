//
//  SearchResultsViewModel.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Alamofire

class SearchResultsViewModel {
    
    private var usersResult: SearcAPIResult? = UserDefaultManager.lastUsersResult
    private let defaultSearchString: String = "star"
    lazy var searchString: String = UserDefaultManager.lastUserSearchString ?? defaultSearchString
    var shouldSearchOnViewLoad: Bool {
        return searchString == defaultSearchString
    }
    
    private var lastSearchDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyy - HH:mm"
        return dateFormatter.string(from: Date())
    }
    
    var lastSearchDateString: String {
        return UserDefaultManager.lastUserSearchDate?.isEmpty == true
            ? ""
            : "Last Search: \(UserDefaultManager.lastUserSearchDate ?? "")"
    }
    
    var count: Int {
        return usersResult?.results.count ?? 0
    }
    
    func search(completion: @escaping (Result<SearcAPIResult, Error>) -> Void) {
        SearchAPI.search(searchString) { [weak self] apiResponse in
            guard let self = self else { return }
            UserDefaultManager.lastUserSearchString = self.searchString
            UserDefaultManager.lastUserSearchDate = self.lastSearchDate
            guard apiResponse.response?.statusCode == 200 else {
                let errorMessage = apiResponse.value?.errorMessage ?? "Unknown Error"
                completion(.failure(errorMessage))
                return
            }
            switch apiResponse.result {
            case .success(let result):
                self.usersResult = result
                UserDefaultManager.lastUsersResult = result
                completion(.success(result))
            case .failure(let error):
                UserDefaultManager.lastUsersResult = nil
                completion(.failure(error))
            }
        }
    }
    
    func createSearchViewModel(from index: Int) -> SearchResultDetailViewModel? {
        guard let results = usersResult?.results, results.indices.contains(index) else { return nil }
        return SearchResultDetailViewModel(result: results[index])
    }
    
}
