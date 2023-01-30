//
//  MovieDetailView.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 29/01/23.
//

import Foundation
import UIKit

class MovieDetailView: UIViewController {
    var presenter: MovieDetailPresenterProtocol?
    var idMovie: Int?
    
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

    var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        return image
    }()

    var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movie Title"
        label.textColor = .white
        return label
    }()

    var movieDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movie Description"
        label.textColor = .white
        label.numberOfLines = 4
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupLayouts()
        self.presenter?.getMovieDetailPresenter(movieId: idMovie ?? 0)
    
    }

    func setupViews() {
        view.addSubview(contanerView)
        view.addSubview(containerView2)
        contanerView.addSubview(movieImage)
        containerView2.addSubview(movieTitle)
        containerView2.addSubview(movieDescription)
    }

    func setupLayouts() {
        NSLayoutConstraint.activate([

            // put containerView1 half of the screen and containerView2 the other half
            contanerView.topAnchor.constraint(equalTo: view.topAnchor),
            contanerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contanerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contanerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),

            containerView2.topAnchor.constraint(equalTo: contanerView.bottomAnchor),
            containerView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            movieImage.topAnchor.constraint(equalTo: contanerView.topAnchor, constant: 50),
            movieImage.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: contanerView.bottomAnchor),

            movieTitle.topAnchor.constraint(equalTo: containerView2.topAnchor, constant: 2),
            movieTitle.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor, constant: 20),
            movieTitle.trailingAnchor.constraint(equalTo: containerView2.trailingAnchor, constant: -20),
            movieTitle.heightAnchor.constraint(equalToConstant: 20),

            movieDescription.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 40),
            movieDescription.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: containerView2.trailingAnchor, constant: -20),
            movieDescription.bottomAnchor.constraint(equalTo: containerView2.bottomAnchor, constant: -50)

        ])
    }
    
    
}


extension MovieDetailView: MovieDetailViewProtocol {

    
    func getMoviesRequestSuccess() {
        DispatchQueue.main.async {
            let imageURl = "https://image.tmdb.org/t/p/w500/" + (self.presenter?.movieDetail?.posterPath ?? "")
            self.movieImage.loadImage(from: imageURl)
            self.movieTitle.text = self.presenter?.movieDetail?.title
            self.movieDescription.text = self.presenter?.movieDetail?.overview
        }
    }
    
    func getMoviesRequestFailure() {
        
    }
    
    
}
