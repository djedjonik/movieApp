//
//  MovieDetailController.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 03.02.2021.
//

import UIKit
import Foundation

class MovieDetailController: UIViewController {

    var movie: MovieModel? {
        didSet {
            movieNameLabel.text = movie?.title
            genreLabel.text = movie?.genre
            if let movie = movie {
                imageView.load(urlString: movie.poster)
            }
        }
    }
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 22.0)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        label.numberOfLines = 1
        return label
    }()

    lazy var titlAndGenreStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        [self.genreLabel,self.movieNameLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    let imdbView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(named: "BackgroundForViews")
        return view
    }()

    let rottenTomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(named: "BackgroundForViews")
        return view
    }()

    let metaCriticView: UIView = {
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

    let rottenTomLabel: UILabel = {
        let label = UILabel()
        label.text = "Rotten Tomatoes"
        label.textColor = UIColor(named: "Background")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()

    let metaCriticLabel: UILabel = {
        let label = UILabel()
        label.text = "Metacritic"
        label.textColor = UIColor(named: "Background")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()

    lazy var ratingStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = UIColor.yellow
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fill
        [self.imdbView,self.rottenTomView,self.metaCriticView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 600)
    
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView(frame: .zero)
          v.translatesAutoresizingMaskIntoConstraints = false
          v.contentSize = contentViewSize
          v.frame = view.bounds
          v.autoresizingMask = .flexibleHeight
          v.showsVerticalScrollIndicator = false
          v.bounces = true
          return v
      }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

    }
    
    private func setUpViews() {
        view.backgroundColor = UIColor(named: "Background")
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        view.addSubview(imageView)
        view.addSubview(titlAndGenreStackView)
        
        imdbView.addSubview(imdbLabel)
        rottenTomView.addSubview(rottenTomLabel)
        metaCriticView.addSubview(metaCriticLabel)
        
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 556).isActive = true
        

        genreLabel.topAnchor.constraint(equalTo: titlAndGenreStackView.topAnchor, constant: 0).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: titlAndGenreStackView.leftAnchor, constant: 0).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: titlAndGenreStackView.rightAnchor, constant: 0).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 50).isActive = true
        movieNameLabel.leftAnchor.constraint(equalTo: titlAndGenreStackView.leftAnchor, constant: 0).isActive = true
        movieNameLabel.rightAnchor.constraint(equalTo: titlAndGenreStackView.rightAnchor, constant: 0).isActive = true

        titlAndGenreStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 38).isActive = true
        titlAndGenreStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 18).isActive = true
        titlAndGenreStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        
    }

}


