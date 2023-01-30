//
//  ProfileProtocols.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 30/01/23.
//

import Foundation
import UIKit


protocol ProfileViewProtocol: AnyObject {
    // Presenter -> View
    //func showLoader()
    //func hideLoader()

    func getProfileRequestSuccess()
    func getProfileRequestFailure()
}

protocol ProfilePresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: ProfileInteractorProtocol? {get set}
    var view: ProfileViewProtocol? {get set}
    var router: ProfileRouterProtocol? {get set}
    func getProfilePresenter()
    var accountDetail: AccountDetailResponse? {get set}
}

protocol ProfileInteractorProtocol: AnyObject {
    // Presenter -> Interactor
    var presenter: ProfileOutputInteractorProtocol? {get set}
    func getProfileDetail()
}

protocol ProfileOutputInteractorProtocol: AnyObject {
    // Interactor -> PresenterOutput
    func onProfileRequestSuccess(data: AccountDetailResponse)
    func onProfileRequestFailure()
}

protocol ProfileRouterProtocol: AnyObject {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
}
