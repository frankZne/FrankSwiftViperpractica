//
//  LoginView.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation
import UIKit


class LoginView: UIViewController {
    
    var presenter: LoginPresenterProtocol?
    let loader = LoadingIndicator()
    let color = UIColor.black
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    private let userTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .white
        txtField.placeholder = "Username"
        txtField.borderStyle = .roundedRect
        txtField.autocapitalizationType = .none
        return txtField
    }()
    
    private let passTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.backgroundColor = .white
        txtField.placeholder = "Password"
        txtField.borderStyle = .roundedRect
        txtField.autocapitalizationType = .none
        txtField.isSecureTextEntry = true
        return txtField
    }()
    
    let btnLogin: UIButton = {
        let btn = UIButton(type:.system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.setTitle("Login", for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        return btn
    }()

    let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .white
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color.darker()
        setUpAutoLayout()
        btnLogin.addTarget(self, action: #selector(action), for: .touchUpInside)
        print("")
        
    }
    
    @objc private func action() {
        if userTextField.text == "" || passTextField.text == "" {
            showAlert(title: "", message: "Datos invalidos")
        }else {
            guard let userName = userTextField.text, let password = passTextField.text else { return }
            self.presenter?.getLogin(username: userName, password: password)
            self.loader.setLoadingIndicator(center: self.logoImageView.center)
        }
    }
    
    func setUpAutoLayout(){
        
        let myLayer = CALayer()
        let myImage = UIImage(named: "BackgroundLogin")?.cgImage
        myLayer.frame = CGRect(x: -20, y: -27, width: self.view.bounds.width, height: self.view.bounds.height)
        myLayer.contents = myImage
        loginContentView.layer.addSublayer(myLayer)
        loginContentView.addSubview(logoImageView)
        loginContentView.addSubview(userTextField)
        loginContentView.addSubview(passTextField)
        loginContentView.addSubview(btnLogin)
        view.addSubview(loginContentView)
        self.view.addSubview(loader)


        NSLayoutConstraint.activate([
            loginContentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            loginContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            logoImageView.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 90),
            logoImageView.centerXAnchor.constraint(equalTo: loginContentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            userTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 90),
            userTextField.leadingAnchor.constraint(equalTo: loginContentView.leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: loginContentView.trailingAnchor, constant: -20),
            userTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: loginContentView.leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: loginContentView.trailingAnchor, constant: -20),
            passTextField.heightAnchor.constraint(equalToConstant: 40),
            
            btnLogin.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            btnLogin.leadingAnchor.constraint(equalTo: loginContentView.leadingAnchor, constant: 20),
            btnLogin.trailingAnchor.constraint(equalTo: loginContentView.trailingAnchor, constant: -20),
            btnLogin.heightAnchor.constraint(equalToConstant: 40)
        ])

    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
}

extension LoginView: LoginViewProtocol {
    func loginViewFailure(message: String) {
        self.loader.stopLoadingIndicator()
        DispatchQueue.main.async {
            self.showAlert(title: "", message: message)
        }
        print("Failure")
    }
    
    func loginViewSuccess() {
        print("Sucess")
        self.loader.stopLoadingIndicator()
        DispatchQueue.main.async {
           // self.navigationController?.pushViewController(vc, animated: true)
            self.presenter?.goToMovieList()
        }
    }
    

}
