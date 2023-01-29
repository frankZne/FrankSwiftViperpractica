//
//  LoginPresenter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation


class LoginPresenter: LoginPresenterProtocol  {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    func getLogin(username: String, password: String) {
        print("")
        interactor?.requestLogin(username: username, password: password)
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
