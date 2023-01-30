//
//  MovieDetailProtocols.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 29/01/23.
//

import Foundation
import UIKit


protocol MovieDetailViewProtocol: class {
    // Presenter -> View
    //func showLoader()
    //func hideLoader()

    func getMoviesRequestSuccess()
    func getMoviesRequestFailure()
}

protocol MovieDetailPresenterProtocol: class {
    // View -> Presenter
    var interactor: MovieDetailInteractorProtocol? {get set}
    var view: MovieDetailViewProtocol? {get set}
    var router: MovieDetailRouterProtocol? {get set}
    func getMovieDetailPresenter(movieId: Int)
    var movieDetail: MovieDetail? {get set}
}

protocol MovieDetailInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: MovieDetailOutputInteractorProtocol? {get set}
    func getMovieDetail(movieId: Int)
}

protocol MovieDetailOutputInteractorProtocol: class {
    // Interactor -> PresenterOutput
    func onMoviesRequestSuccess(data: MovieDetail)
    func onMoviesRequestFailure()
}

protocol MovieDetailRouterProtocol: class {
    //Presenter -> Wireframe
    static func createModule(idMovie: Int) -> UIViewController
}
