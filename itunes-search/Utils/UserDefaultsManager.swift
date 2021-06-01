//
//  UserDefaultsManager.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Foundation

public enum UserDefaultManager {
    private static let itunesAppKey = "itunes.search"
    private static let userLastResultKey = "\(itunesAppKey)-userLastResult"
    private static let userLastSearchKey = "\(itunesAppKey)-userLastSearch"
    private static let userLastSearchStringKey = "\(itunesAppKey)-userLastSearchString"
    
    static var lastUsersResult: SearcAPIResult? {
        get {
            guard let data = UserDefaults.standard.object(forKey: userLastResultKey) as? Data,
                  let result = try? JSONDecoder().decode(SearcAPIResult.self, from: data) else { return nil }
            return result
        }
        set {
            UserDefaults.standard.set(try? JSONEncoder().encode(newValue), forKey: userLastResultKey)
        }
    }
    
    static var lastUserSearchDate: String? {
        get {
            return UserDefaults.standard.string(forKey: userLastSearchKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userLastSearchKey)
        }
    }
    
    static var lastUserSearchString: String? {
        get {
            return UserDefaults.standard.string(forKey: userLastSearchStringKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userLastSearchStringKey)
        }
    }
}
