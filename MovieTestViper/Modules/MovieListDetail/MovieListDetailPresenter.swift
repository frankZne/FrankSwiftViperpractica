//
//  MovieListDetailPresenter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation


class MovieListDetailPresenter: MovieListDetailPresenterProtocol {
    weak var view: MovieListDetailViewProtocol?
    var interactor: MovieListDetailInteractorProtocol?
    var router: MovieListDetailRouterProtocol?
    var moviesList: [Movie]?

    
    func getMovieList(filter: MovieCategoryFilter) {
        interactor?.getMovies(filter: filter)
    }
}

extension MovieListDetailPresenter: MovieListDetailOutputInteractorProtocol {
    func onMoviesRequestSuccess(data: [Movie]) {
        self.moviesList = data
        self.view?.getMoviesRequestSuccess(data: data)
    }
    
    func onMoviesRequestFailure() {
        
    }
    
        
}
