//
//  MovieListDetailRouter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation
import UIKit

class MovieListDetailRouter: MovieListDetailRouterProtocol {
    class func createModule() -> UIViewController {
        let view = MovieListDetailView()
        let router: MovieListDetailRouterProtocol = MovieListDetailRouter()
        let presenter: MovieListDetailPresenterProtocol & MovieListDetailOutputInteractorProtocol = MovieListDetailPresenter()
        let interactor: MovieListDetailInteractorProtocol = MovieListDetailInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func gotoMovieDetail(view: UIViewController, idMovie: Int) {
        let router = MovieDetailRouter.createModule(idMovie: idMovie)
        view.navigationController?.pushViewController(router, animated: true)

    }
}
