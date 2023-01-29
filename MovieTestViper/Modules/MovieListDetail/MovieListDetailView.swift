//
//  MovieListDetailView.swift
//  MovieTestViper
//
//  Created by francisco rafael aguilar lugo on 24/01/23.
//

import Foundation
import UIKit


class MovieListDetailView: UIViewController {
    
    var presenter: MovieListDetailPresenterProtocol?
    var profiles2: [MovieCategoryFilter] = []

    
    private let moviesCollectionView: UICollectionView = {
        let viewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    private let selectCategoryCollectionView: UICollectionView = {
        let viewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0/2
        static let itemHeight: CGFloat = 300.0/2
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.backgroundColor = .darkGray
        self.navigationController?.navigationBar.tintColor = UIColor.systemGray
        setupViews()
        setupLayouts()
        populateMoviesCells2()
        
        presenter?.getMovieList(filter: profiles2.first!)
        
       /* viewModel._moviesList.bindAndFire { [weak self] _ in
            DispatchQueue.main.async {
                self?.moviesCollectionView.reloadData()
            }
        }*/
        
        
        DispatchQueue.main.async {
            self.selectCategoryCollectionView.reloadData()
        }
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonTopBar))
        navigationItem.rightBarButtonItems = [add]
        navigationItem.title = "TV Shows"
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(selectCategoryCollectionView)
        view.addSubview(moviesCollectionView)
        
        if let flow =  selectCategoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            flow.scrollDirection = .horizontal
        }
        
        selectCategoryCollectionView.dataSource = self
        selectCategoryCollectionView.delegate = self
        selectCategoryCollectionView.register(CategoryFilterCell.self, forCellWithReuseIdentifier: CategoryFilterCell.cellIdentifier)
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        moviesCollectionView.register(MovieListCell.self, forCellWithReuseIdentifier: MovieListCell.identifier)
    }
    
    @objc func buttonTopBar() {
       /* let vc = ProfileViewController()
        present(vc, animated: true)*/
    }
    
    private func setupLayouts() {
        selectCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        moviesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectCategoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            selectCategoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            selectCategoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            selectCategoryCollectionView.heightAnchor.constraint(equalToConstant: 100),
            moviesCollectionView.topAnchor.constraint(equalTo: selectCategoryCollectionView.bottomAnchor),
            moviesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            moviesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            moviesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func populateMoviesCells2() {
        profiles2 = [
            .popular,
            .topRated,
            .onTV,
            .airingToday
        ]
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension MovieListDetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView  == self.selectCategoryCollectionView {
            return profiles2.count
        }
        
        return presenter?.moviesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var emptyCell = UICollectionViewCell()
        
        if collectionView == self.selectCategoryCollectionView {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFilterCell.cellIdentifier, for: indexPath) as! CategoryFilterCell
            let profile2 = profiles2[indexPath.row]
            cell2.setup(with: profile2)
            cell2.contentView.backgroundColor = .darkGray
            return cell2
        }
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.identifier, for: indexPath) as! MovieListCell
            if let profile = presenter?.moviesList?[indexPath.row] {
                cell.setup(with: profile)
                cell.contentView.backgroundColor = UIColor(red: 0, green: 0.110, blue: 0.110, alpha: 1.0)
                return cell
            }
        }
        return emptyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView  == self.selectCategoryCollectionView {
            presenter?.moviesList?.removeAll()
            presenter?.getMovieList(filter: profiles2[indexPath.item])
            self.presenter?.getMovieList(filter: profiles2[indexPath.item])
            
        } else {
           /*
            let vc = SelectedMovieDetailViewController()
            vc.id = presenter?.moviesList?[indexPath.row].id
            navigationController?.pushViewController(vc, animated: true)*/
        }
        
    }
    
}

extension MovieListDetailView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.selectCategoryCollectionView {
            let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
            return CGSize(width: width/2, height: LayoutConstant.itemHeight/3)
        } else {
            let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
            return CGSize(width: width, height: LayoutConstant.itemHeight*2.5)
        }
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}

extension MovieListDetailView: MovieListDetailViewProtocol {
   
    func getMoviesRequestSuccess(data: [Movie]) {
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
    }
    
    func getMoviesRequestFailure() {
        
    }
    
}
