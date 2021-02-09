//
//  MovieCell.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 01.02.2021.
//

import UIKit
import Foundation

class MovieCell: UICollectionViewCell {
    
    var movie: MovieModel? {
        didSet {
            movieNameLabel.text = movie?.title
            genreLabel.text = movie?.genre
            directorlLabel.text = movie?.director
            imdbRatingLabel.text = movie?.imdbRating
            if let movie = movie {
                imageView.load(urlString: movie.poster)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let shadowView: UIView = {
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 226, height: 354))
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor(named: "BackgroundForViews")?.cgColor
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowOffset = CGSize.zero
        outerView.layer.shadowRadius = 16
        outerView.layer.masksToBounds = false
        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 16).cgPath
        return outerView
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue", size: 20.0)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        label.numberOfLines = 1
        return label
    }()
    
    let directorlLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 14.0)
        label.numberOfLines = 1
        return label
    }()
    
    let imdbView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(named: "BackgroundForViews")
        return view
    }()
    
    let imdbLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.textColor = UIColor(named: "Background")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()
    
    let imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 0.8078431373, blue: 0, alpha: 0.74)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var titlAndGenreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var ratingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .leading
        stack.distribution = .fill
        stack.contentMode = .scaleAspectFit
        return stack
    }()
    
    func setUpViews() {
        backgroundColor = UIColor.clear
        
        addSubview(mainStackView)
        addSubview(titlAndGenreStackView)
        addSubview(ratingStackView)
        
        
        mainStackView.addSubview(shadowView)
        mainStackView.addSubview(titlAndGenreStackView)
        mainStackView.addSubview(ratingStackView)
        titlAndGenreStackView.addSubview(movieNameLabel)
        titlAndGenreStackView.addSubview(genreLabel)
        ratingStackView.addSubview(imdbView)
        ratingStackView.addSubview(directorlLabel)
        imdbView.addSubview(imdbLabel)
        imdbView.addSubview(imdbRatingLabel)
        shadowView.addSubview(imageView)
        
        //Views in MainStackView Constrains
        addConstrainsWithFormat(format: "V:|-33-[v0(354)]-20-[v1]-10-[v2(28)]|", views: shadowView,titlAndGenreStackView,ratingStackView)
        
        addConstrainsWithFormat(format: "H:|[v0(226)]|", views: shadowView)
        
        addConstrainsWithFormat(format: "H:|[v0]-8-|", views: titlAndGenreStackView)
        
        addConstrainsWithFormat(format: "H:|[v0]-8-|", views: ratingStackView)
        
        
        //GenreAndTitle Constrains
        addConstrainsWithFormat(format: "V:|[v0][v1]|", views: genreLabel,movieNameLabel)
        addConstrainsWithFormat(format: "H:|[v0]|", views: genreLabel)
        addConstrainsWithFormat(format: "H:|[v0]|", views: movieNameLabel)
        
        
        //ImageView Constrains
        addConstrainsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstrainsWithFormat(format: "V:|[v0]|", views: imageView)
        
        //RatingLabels in ratingStackView Constrains
        addConstrainsWithFormat(format: "H:|[v0]-10-[v1]|", views: imdbView,directorlLabel)
        addConstrainsWithFormat(format: "H:|-9-[v0]-5-[v1]-8-|", views: imdbLabel,imdbRatingLabel)
        addConstrainsWithFormat(format: "V:|-7-[v0]-7-|", views: imdbLabel)
        addConstrainsWithFormat(format: "V:|-7-[v0]-7-|", views: imdbRatingLabel)

        
        //MainStackView Constrains
        addConstrainsWithFormat(format: "H:|[v0]|", views: mainStackView)
        
        addConstrainsWithFormat(format: "V:|[v0]|", views: mainStackView)
        
    }
}
