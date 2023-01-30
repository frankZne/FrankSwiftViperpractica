//
//  MovieListDetailProtocols.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import UIKit


protocol MovieListDetailViewProtocol: AnyObject {
    // Presenter -> View
    //func showLoader()
    //func hideLoader()

    func getMoviesRequestSuccess(data: [Movie])
    func getMoviesRequestFailure()
}

protocol MovieListDetailPresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: MovieListDetailInteractorProtocol? {get set}
    var view: MovieListDetailViewProtocol? {get set}
    var router: MovieListDetailRouterProtocol? {get set}
    func getMovieList(filter: MovieCategoryFilter)
    func goToMovieDetailPresenter(idMovie: Int)
    var moviesList: [Movie]? {get set}

}

protocol MovieListDetailInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: MovieListDetailOutputInteractorProtocol? {get set}
    func getMovies(filter: MovieCategoryFilter)
}

protocol MovieListDetailOutputInteractorProtocol: AnyObject {
    // Interactor -> PresenterOutput
    func onMoviesRequestSuccess(data: [Movie])
    func onMoviesRequestFailure()
}

protocol MovieListDetailRouterProtocol: AnyObject {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
    func gotoMovieDetail(view: UIViewController, idMovie: Int)
}
