//
//  LoginRouter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation
import UIKit


class LoginRouter: LoginRouterProtocol {
    class func createModule() -> UIViewController {
        let view = LoginView()
        let router: LoginRouterProtocol = LoginRouter()
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter()
        let interactor: LoginInteractorProtocol = LoginInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    
}
