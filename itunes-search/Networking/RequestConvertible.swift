//
//  RequestConvertible.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Alamofire

protocol RequestConvertible: URLRequestConvertible {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

extension RequestConvertible {
    
    var clientUrl: String {
        return "https://itunes.apple.com"
    }
    
    var headers: HTTPHeaders? {
        return [HTTPHeader(name: "Content-Type", value: "application/json; charset=UTF-8")]
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let urlString = (clientUrl + path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString) else {
            throw AFError.invalidURL(url: clientUrl + path)
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.method = method
        if let encodedRequest = try? URLEncoding.default.encode(urlRequest, with: parameters) {
            urlRequest = encodedRequest
        }
        urlRequest.allHTTPHeaderFields = headers?.dictionary
        return urlRequest
    }
}
