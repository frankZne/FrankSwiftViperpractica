//
//  ProfileView.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 30/01/23.
//

import Foundation
import UIKit

class ProfileView: UIViewController {
    
    var presenter: ProfilePresenterProtocol?
    
    var contanerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    var containerView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        return image
    }()

    var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "username"
        label.font = UIFont(name: "MarkerFelt-Thin", size: 26)
        label.textColor = .white
        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.textColor = .white
        label.numberOfLines = 7
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupLayouts()
        presenter?.getProfilePresenter()
    }
    
    func setupViews() {
        view.addSubview(contanerView)
        view.addSubview(containerView2)
        contanerView.addSubview(profileImage)
        containerView2.addSubview(userNameLabel)
        containerView2.addSubview(descriptionLabel)
    }

    func setupLayouts() {
        NSLayoutConstraint.activate([

            contanerView.topAnchor.constraint(equalTo: view.topAnchor),
            contanerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contanerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contanerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),

            containerView2.topAnchor.constraint(equalTo: contanerView.bottomAnchor),
            containerView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            profileImage.topAnchor.constraint(equalTo: contanerView.topAnchor, constant: 50),
            profileImage.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor),
            profileImage.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor),
            profileImage.bottomAnchor.constraint(equalTo: contanerView.bottomAnchor),

            userNameLabel.topAnchor.constraint(equalTo: containerView2.topAnchor, constant: 12),
            userNameLabel.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor, constant: 20),
            userNameLabel.trailingAnchor.constraint(equalTo: containerView2.trailingAnchor, constant: -20),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView2.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView2.bottomAnchor, constant: -50)

        ])
    }
    
}

extension ProfileView: ProfileViewProtocol {
    func getProfileRequestSuccess() {
        DispatchQueue.main.async {
            self.userNameLabel.text = self.presenter?.accountDetail?.username
            self.descriptionLabel.text = String(self.presenter?.accountDetail?.id ?? 0)
            print(self.presenter?.accountDetail?.name)
            
            let imageURl = "https://image.tmdb.org/t/p/w500/" + (self.presenter?.accountDetail?.avatar?.tmdb?.avatarPath ?? "")
            self.profileImage.loadImage(from: imageURl)
        }
    }
    
    func getProfileRequestFailure() {
        
    }
    
    
}
