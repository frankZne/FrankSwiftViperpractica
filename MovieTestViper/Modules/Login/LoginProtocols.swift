//
//  LoginProtocols.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import UIKit


protocol LoginViewProtocol: AnyObject {
    // Presenter -> View
    //func showLoader()
    //func hideLoader()

    func loginViewSuccess()
    func loginViewFailure(message: String)
}

protocol LoginPresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: LoginInteractorProtocol? {get set}
    var view: LoginViewProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
    func getLogin(username: String, password: String)
    func goToMovieList()
}

protocol LoginInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: LoginOutputInteractorProtocol? {get set}
    func requestLogin(username: String, password: String)
}

protocol LoginOutputInteractorProtocol: AnyObject {
    // Interactor -> PresenterOutput
    func onLoginSuccess()
    func onLoginFailure(message: String)
}

protocol LoginRouterProtocol: AnyObject {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
    func goToMovieListDetail(view: UIViewController)
}
