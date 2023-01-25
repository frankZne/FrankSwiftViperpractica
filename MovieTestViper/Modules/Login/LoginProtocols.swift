//
//  LoginProtocols.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import UIKit


protocol LoginViewProtocol: class {
    // Presenter -> View
    //func showLoader()
    //func hideLoader()

    func loginViewSuccess()
    func loginViewFailure()
}

protocol LoginPresenterProtocol: class {
    // View -> Presenter
    var interactor: LoginInteractorProtocol? {get set}
    var view: LoginViewProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
    func getLogin(username: String, password: String)
}

protocol LoginInteractorProtocol: class {
    // Presenter -> Interactor
    var presenter: LoginOutputInteractorProtocol? {get set}
    func requestLogin(username: String, password: String)
}

protocol LoginOutputInteractorProtocol: class {
    // Interactor -> PresenterOutput
    func onLoginSuccess()
    func onLoginFailure()
}

protocol LoginRouterProtocol: class {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
}
