//
//  MovieDetailPresenter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 29/01/23.
//

import Foundation



class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var interactor: MovieDetailInteractorProtocol?
    var view: MovieDetailViewProtocol?
    var router: MovieDetailRouterProtocol?
    var movieDetail: MovieDetail?
    
    func getMovieDetailPresenter(movieId: Int) {
        self.interactor?.getMovieDetail(movieId: movieId)
    }
}

extension MovieDetailPresenter: MovieDetailOutputInteractorProtocol {
    func onMoviesRequestSuccess(data: MovieDetail) {
        print(data.title)
        self.movieDetail = data
        self.view?.getMoviesRequestSuccess()
    }
    
    func onMoviesRequestFailure() {
        
    }
    
}
