//
//  LoginEntity.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool?
    let expiresAt, requestToken: String?

    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}

struct ResponseSesionID: Codable {
    let success: Bool?
    let sessionId: String?

    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}

struct RequestSesionID: Codable {
    let accessToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "request_token"
    }
}

struct LoginRequest: Codable {
    let username: String
    let password: String
    let request_token: String
}

struct RequestTokenResponse: Codable {
    let success: Bool
    let expiresAt, requestToken: String?

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}


struct RequestAccountDetail: Codable {
    let apiKey: String
    let sessionId: String

    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case sessionId = "session_id"
    }
}

struct AccountDetailResponse: Codable {
    let avatar: Avatar?
    let id: Int?
    let iso639_1, iso3166_1, name: String?
    let includeAdult: Bool?
    let username: String?

    enum CodingKeys: String, CodingKey {
        case avatar, id
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name
        case includeAdult = "include_adult"
        case username
    }
}

// MARK: - Avatar
struct Avatar: Codable {
    let gravatar: Gravatar?
    let tmdb: Tmdb?
}

// MARK: - Gravatar
struct Gravatar: Codable {
    let hash: String?
}

// MARK: - Tmdb
struct Tmdb: Codable {
    let avatarPath: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }
    
}
