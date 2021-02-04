//
//  MovieCell.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 28.01.2021.
//

import UIKit
import Foundation


class MoviesCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var moviesViewController : MovieViewController?
    
    var networkMovieManager = MovieNetworkManager()
    
    var moviesArray = Movies()
    
    private let movieCell = "MovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getMoviesArray()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 34
        layout.minimumLineSpacing = 34

        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false 
        
        return collectionView
    }()
    
    func getMoviesArray() {
        
        networkMovieManager.fetchJson { (result) in
            switch result {
            case .success(let movies):
                self.moviesArray = movies
                    DispatchQueue.main.async {
                        self.moviesCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func setUpViews() {
        backgroundColor = UIColor.clear
        
        addSubview(moviesCollectionView)
        
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        moviesCollectionView.register(MovieCell.self, forCellWithReuseIdentifier: movieCell)
        
        addConstrainsWithFormat(format: "H:|[v0]|", views: moviesCollectionView)
        
        addConstrainsWithFormat(format: "V:|[v0]|", views: moviesCollectionView)
            
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return moviesArray.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: movieCell, for: indexPath) as! MovieCell
        cell.movie = moviesArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 226, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let movie = moviesArray[indexPath.item]
            moviesViewController?.showMovieDetailForMovie(movie: movie)
    }
    
}


