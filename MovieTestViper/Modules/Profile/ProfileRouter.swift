//
//  ProfileRouter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 30/01/23.
//

import Foundation
import UIKit


class ProfileRouter: ProfileRouterProtocol {
    class func createModule() -> UIViewController {
        let view = ProfileView()
        let router: ProfileRouterProtocol = ProfileRouter()
        let presenter: ProfilePresenterProtocol & ProfileOutputInteractorProtocol = ProfilePresenter()
        let interactor: ProfileInteractorProtocol = ProfileInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
