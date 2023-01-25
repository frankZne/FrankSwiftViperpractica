//
//  Movie.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation

struct MoviesResponse: Codable {
    let results: [Movie]?
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}


struct Movie: Codable {
    let posterPath: String?
    let adult: Bool?
    let overview, releaseDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle: String?
    let title, backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}




