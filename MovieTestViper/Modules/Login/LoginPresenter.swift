//
//  LoginPresenter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation
import UIKit


class LoginPresenter: LoginPresenterProtocol  {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    func getLogin(username: String, password: String) {
        print("")
        interactor?.requestLogin(username: username, password: password)
    }
    
    func goToMovieList()  {
        if let viewController = view as? LoginView {
            router?.goToMovieListDetail(view: viewController)
        }
    }
    
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func onLoginFailure(message: String) {
        print("")
        self.view?.loginViewFailure(message: message)
    }
    
    func onLoginSuccess() {
        print("success")
        self.view?.loginViewSuccess()
    }
    
}
