//
//  CategoryFilterCell.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 26/01/23.
//

import Foundation


import UIKit

protocol CategoryFilterCellReusableView: AnyObject {
    static var cellIdentifier: String { get }
}

final class CategoryFilterCell: UICollectionViewCell {
    
    private enum Constants {
        static let contentViewCornerRadius: CGFloat = 4.0
        static let imageHeight: CGFloat = 180.0
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let profileDescriptionVerticalPadding: CGFloat = 8.0
    }
    
    let titleFilter: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
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
        contentView.addSubview(titleFilter)
    }
    
    private func setupLayouts() {
        titleFilter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleFilter.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleFilter.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with text: MovieCategoryFilter) {
        titleFilter.text = text.rawValue
    }
}


extension CategoryFilterCell: CategoryFilterCellReusableView {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}



