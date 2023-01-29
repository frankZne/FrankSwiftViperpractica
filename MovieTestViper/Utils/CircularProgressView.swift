//
//  CircularProgressView.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 26/01/23.
//
import UIKit

class LoadingIndicator: UIActivityIndicatorView {
    
    func setLoadingIndicator(center: CGPoint) {
        self.style = .large
        self.center = center
        self.color = .white
        DispatchQueue.main.async {
            self.startAnimating()
        }
    }
    
    func stopLoadingIndicator() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
}
