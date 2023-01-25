//
//  ApiCall.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation

public enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

class ApiCall {
    static public var shared = ApiCall()
    private let apiKey = Environment.apiKey
    private let urlSession = URLSession.shared
    
    func fetchResources<T: Decodable>(url: URL, queryParameters: [String: String]? = nil, completion: (@escaping (Result<T, APIServiceError>) -> Void)) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        
        if let queryParameters = queryParameters {
            urlComponents.queryItems?.append(contentsOf: queryParameters.map { URLQueryItem(name: $0, value: $1) })
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if let data = data, let response = response {
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    _ = String(data: data, encoding: .utf8)
                    let values = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            }
            if error != nil {
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    func postResources<T: Decodable, U: Encodable>(url: URL, body: U, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            print(error.localizedDescription)
        }
        
        urlSession.dataTask(with: request) { (data, response, error) in
            if let data = data, let response = response {
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let dataString = String(data: data, encoding: .utf8)
                    let values = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(values))
                    print(values)
                } catch {
                    completion(.failure(.decodeError))
                }
            }
            
            if error != nil {
                completion(.failure(.apiError))
            }
            
        }.resume()
    }
}



