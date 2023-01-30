//
//  MovieDetailInteractor.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 29/01/23.
//

import Foundation



class MovieDetailInteractor: MovieDetailInteractorProtocol {
    var presenter: MovieDetailOutputInteractorProtocol?
    
    func getMovieDetail(movieId: Int) {
        ServicesAPI.shared.getMovieDetail(id: movieId) { [weak self] result in
            switch result {
            case .success(let movieDetail):
                self?.presenter?.onMoviesRequestSuccess(data: movieDetail)
            case .failure(let error):
                print(error)
            }
        }
    }
}
