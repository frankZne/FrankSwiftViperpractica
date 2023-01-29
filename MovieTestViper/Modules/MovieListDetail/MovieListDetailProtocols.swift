//
//  MovieListDetailProtocols.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import UIKit


protocol MovieListDetailViewProtocol: class {
    // Presenter -> View
    //func showLoader()
    //func hideLoader()

    func getMoviesRequestSuccess(data: [Movie])
    func getMoviesRequestFailure()
}

protocol MovieListDetailPresenterProtocol: class {
    // View -> Presenter
    var interactor: MovieListDetailInteractorProtocol? {get set}
    var view: MovieListDetailViewProtocol? {get set}
    var router: MovieListDetailRouterProtocol? {get set}
    func getMovieList(filter: MovieCategoryFilter)
    var moviesList: [Movie]? {get set}

}

protocol MovieListDetailInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: MovieListDetailOutputInteractorProtocol? {get set}
    func getMovies(filter: MovieCategoryFilter)
}

protocol MovieListDetailOutputInteractorProtocol: class {
    // Interactor -> PresenterOutput
    func onMoviesRequestSuccess(data: [Movie])
    func onMoviesRequestFailure()
}

protocol MovieListDetailRouterProtocol: class {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
}
