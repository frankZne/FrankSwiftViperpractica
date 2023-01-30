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
    
    func gotoProfilePresenter() {
        if let viewController = view as? MovieListDetailView {
            router?.gotoProfile(view: viewController)
        }
    }
    
    func goToMovieDetailPresenter(idMovie: Int){
        if let viewController = view as? MovieListDetailView {
            router?.gotoMovieDetail(view: viewController, idMovie: idMovie)
        }
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
