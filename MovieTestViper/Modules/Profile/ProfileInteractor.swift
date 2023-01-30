//
//  ProfileInteractor.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 30/01/23.
//

import Foundation


class ProfileInteractor: ProfileInteractorProtocol {
    var presenter: ProfileOutputInteractorProtocol?
    
    func getProfileDetail() {
        
        let sessionId = UserDefaults.standard.string(forKey: "sessionId") ?? ""
        ServicesAPI.shared.getAccountDetail(sessionId: sessionId) { result in
            switch result {
            case .success(let response):
                //self.account = response
                //completion(true)
                print(response)
                self.presenter?.onProfileRequestSuccess(data: response)
            case .failure(let error):
                print(error)
                //completion(false)
            }
        }
        
    }
    
    

    
}
