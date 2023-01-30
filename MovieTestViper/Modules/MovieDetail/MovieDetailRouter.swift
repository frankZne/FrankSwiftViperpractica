//
//  MovieDetailRouter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 29/01/23.
//

import Foundation
import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    class func createModule(idMovie: Int) -> UIViewController {
        let view = MovieDetailView()
        let router: MovieDetailRouterProtocol = MovieDetailRouter()
        let presenter: MovieDetailPresenterProtocol & MovieDetailOutputInteractorProtocol = MovieDetailPresenter()
        let interactor: MovieDetailInteractorProtocol = MovieDetailInteractor()
        
        view.idMovie = idMovie
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}

    
