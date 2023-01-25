//
//  LoginInteractor.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation



class LoginInteractor: LoginInteractorProtocol {

    
    weak var presenter: LoginOutputInteractorProtocol?
    var userdefaults = UserDefaults.standard
    
    func requestLogin(username: String, password: String) {
        
        ServicesAPI.shared.createRequestToken { result in
            switch result {
                case .success(let response):
                    if let requestToken = response.requestToken{
                        ServicesAPI.shared.login(username: username, password: password,requestToken: requestToken) { result in
                            switch result{
                            case .success(let response):
                                let loginRequestToken = response.requestToken ?? ""
                               // self.presenter?.onLoginSuccess()
                                DispatchQueue.main.async {
                                    self.requestSessionId(loginRequestToken: loginRequestToken)
                                }
                               /* ServicesAPI.shared.getSessionId(requestToken: loginRequestToken) { result in
                                    switch result{
                                    case .success(let response):
                                        self.userdefaults.set(response.sessionId, forKey: "sessionId")
                                        //self.presenter?.onLoginSuccess()
                                    case .failure(let error):
                                        print(error)
                                        //completion(false)
                                        self.presenter?.onLoginFailure()
                                    }
                                }*/
                            case .failure(let error):
                                print(error)
                                //completion(false)
                                self.presenter?.onLoginFailure()
                            }
                        }
                    }
                case .failure(let error):
                print(error)
                    //completion(false)
                self.presenter?.onLoginFailure()
            }
        }

    }
    
    func requestSessionId(loginRequestToken: String) {
    
    ServicesAPI.shared.getSessionId(requestToken: loginRequestToken) { result in
        switch result{
        case .success(let response):
            self.userdefaults.set(response.sessionId, forKey: "sessionId")
            DispatchQueue.main.async {
                self.presenter?.onLoginSuccess()
            }
        case .failure(let error):
            print(error)
            //completion(false)
            self.presenter?.onLoginFailure()
        }
    }
    }
}
