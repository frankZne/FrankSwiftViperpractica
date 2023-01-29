//
//  MovieListCell.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 26/01/23.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class MovieListCell: UICollectionViewCell {
    
    private enum Constants {
        static let contentViewCornerRadius: CGFloat = 4.0
        static let imageHeight: CGFloat = 180.0/2
        static let verticalSpacing: CGFloat = 1.0
        static let horizontalPadding: CGFloat = 1.0
        static let profileDescriptionVerticalPadding: CGFloat = 1.0
    }
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let professionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white
        contentView.addSubview(movieImageView)
        contentView.addSubview(name)
        contentView.addSubview(locationLabel)
        contentView.addSubview(professionLabel)
    }
    
    private func setupLayouts() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])
        
        NSLayoutConstraint.activate([
            
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            name.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: Constants.profileDescriptionVerticalPadding * 50)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            locationLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            professionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            professionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8.0),
            professionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.profileDescriptionVerticalPadding * 4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with movie: Movie) {
        let imageURl = "https://image.tmdb.org/t/p/w500/" + (movie.posterPath ?? "")
        movieImageView.loadImage(from: imageURl)
        name.text = movie.title ?? ""
        let icon = UIImage(systemName: "star")?.withTintColor(.green)
        
        let attachment = NSTextAttachment()
        attachment.image = icon
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: String(format: "%.1f", movie.voteAverage!))
        //myString.append(attachmentString)
        myString.insert(attachmentString, at: 0)
        locationLabel.attributedText = myString
        professionLabel.text = movie.overview ?? ""
    }
    
}

extension MovieListCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

