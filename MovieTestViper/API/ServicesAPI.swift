//
//  ServicesAPI.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation

class ServicesAPI{
    
    public static let shared = ServicesAPI()
    private let baseURL = URL(string: "\(Environment.rootURL)")!
    
    public enum Endpoint: String {
        case popular = "popular"
        case topRated = "top_rated"
        case onTV = "on_the_air"
        case airingToday = "airing_today"
    }
    
    public func fetchMovies(from endpoint: Endpoint, result: @escaping (Result<MoviesResponse, APIServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent("movie")
            .appendingPathComponent(endpoint.rawValue)
        ApiCall.shared.fetchResources(url: url, completion: result)
    }
    
    public func fetchTV(from endpoint: Endpoint, result: @escaping (Result<MoviesResponse, APIServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent("tv")
            .appendingPathComponent(endpoint.rawValue)
        ApiCall.shared.fetchResources(url: url, completion: result)
    }
    
    
    public func login(username: String, password: String, requestToken: String, result: @escaping (Result<LoginResponse, APIServiceError>) -> Void) {
        let url = URL(string: "\(Environment.rootURL)/authentication/token/validate_with_login")!
        let loginRequest = LoginRequest(username: username, password: password, request_token: requestToken)
        ApiCall.shared.postResources(url: url, body: loginRequest, completion: result)
    }
    
    func createRequestToken(result: @escaping (Result<RequestTokenResponse, APIServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent("authentication")
            .appendingPathComponent("token")
            .appendingPathComponent("new")
        ApiCall.shared.fetchResources(url: url, completion: result)
        
    }
    
    func getMovieDetail(id: Int, result: @escaping (Result<MovieDetail, APIServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent("movie")
            .appendingPathComponent("\(id)")
        ApiCall.shared.fetchResources(url: url, completion: result)
    }
    
    func getSessionId(requestToken: String, result: @escaping (Result<ResponseSesionID, APIServiceError>) -> Void) {
        
        let url = baseURL
            .appendingPathComponent("authentication")
            .appendingPathComponent("session")
            .appendingPathComponent("new")
        
        let body = RequestSesionID(accessToken: requestToken)
        ApiCall.shared.postResources(url: url, body: body, completion: result)
    }
    
    func getAccountDetail(sessionId: String, result: @escaping (Result<AccountDetailResponse, APIServiceError>) -> Void) {
        let url = baseURL
            .appendingPathComponent("account")
        
        
        ApiCall.shared.fetchResources(url: url, queryParameters: ["session_id": sessionId], completion: result)
    }
}
