//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 28.01.2021.
//

import UIKit

private let cellId = "cellId"

private let headerViewId = "headerViewId"

class MovieViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.alwaysBounceVertical = true
        
        navigationController?.isNavigationBarHidden = true
        
        collectionView?.backgroundColor = UIColor(named: "Background")
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewId)
        
        collectionView.register(MoviesCell.self, forCellWithReuseIdentifier: cellId)
       
    }
      
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        
    }
    
    func showMovieDetailForMovie(movie: MovieModel) {
        let movieDetailController = MovieDetailController()
        movieDetailController.movie = movie
        movieDetailController.modalPresentationStyle = .popover
        navigationController?.present(movieDetailController, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoviesCell
        cell.moviesViewController = self

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 600)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 134)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewId, for: indexPath) as! HeaderView

          headerView.frame.size.height = 134

          return headerView
      }
        
}
    

