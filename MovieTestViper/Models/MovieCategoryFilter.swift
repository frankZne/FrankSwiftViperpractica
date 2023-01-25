//
//  MovieCategoryFilter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation

enum MovieCategoryFilter: String {
    case popular = "Popular"
    case topRated = "Top Rated"
    case onTV = "On TV"
    case airingToday = "Airing Today"
}

extension MovieCategoryFilter {
    
    var filter: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .onTV:
            return "on_the_air"
        case .airingToday:
            return "airing_today"
        }
    }
    
}
