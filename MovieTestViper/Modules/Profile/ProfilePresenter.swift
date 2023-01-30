//
//  ProfilePresenter.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 30/01/23.
//

import Foundation



class ProfilePresenter: ProfilePresenterProtocol {
    var accountDetail: AccountDetailResponse?
    var interactor: ProfileInteractorProtocol?
    var view: ProfileViewProtocol?
    var router: ProfileRouterProtocol?
    
    func getProfilePresenter() {
        self.interactor?.getProfileDetail()
    }
        
}

extension ProfilePresenter: ProfileOutputInteractorProtocol {
    
    func onProfileRequestSuccess(data: AccountDetailResponse) {
        print(data)
        self.accountDetail = data
        view?.getProfileRequestSuccess()
    }
    
    func onProfileRequestFailure() {
        
    }
    
    
}
