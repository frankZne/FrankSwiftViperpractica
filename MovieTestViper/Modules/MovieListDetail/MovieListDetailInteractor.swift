//
//  MovieListDetailInteractor.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation


class MovieListDetailInteractor: MovieListDetailInteractorProtocol {
    
    weak var presenter: MovieListDetailOutputInteractorProtocol?

    
    func getMovies(filter: MovieCategoryFilter) {
        
        var selectedCategory: ServicesAPI.Endpoint
        var isTv = false
        
        switch filter {
        case .popular:
            selectedCategory = .popular
        case .topRated:
            selectedCategory = .topRated
        case .onTV:
            selectedCategory = .onTV
            isTv = true
        case .airingToday:
            selectedCategory = .airingToday
            isTv = true
        }
        
        var call = ServicesAPI.shared.fetchMovies
        
        if isTv {
            call = ServicesAPI.shared.fetchTV
        }
        
        
        call(selectedCategory) { [weak self] result in
            switch result {
            case .success(let moviesResponse):
                //self?.moviesList = moviesResponse.results ?? []
                DispatchQueue.main.async {
                    if let safeMovieResponse = moviesResponse.results {
                        self?.presenter?.onMoviesRequestSuccess(data: safeMovieResponse)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        

        
    }

    
    
}
