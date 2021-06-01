//
//  Extensions.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Foundation

extension KeyedDecodingContainer {
    func decode<T>(forKey key: K, defaultValue: T) throws -> T
        where T: Decodable {
            return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
