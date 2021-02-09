//
//  MovieDetailController.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 03.02.2021.
//

import UIKit
import Foundation

class MovieDetailController: UIViewController {
    
    private var writersCollectionView: UICollectionView?
    
    var movie: MovieModel? {
        didSet {
            movieNameLabel.text = movie?.title
            genreLabel.text = movie?.genre
            relesedLabel.text = movie?.released
            runTimeLabel.text = movie?.runtime
            directorLabel.text = movie?.director
            storyLabel.text = movie?.plot
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
    
    let relesedLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Relesed"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let relesedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let runTimeLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Runtime"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let runTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let directorTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Director"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let directorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let storyTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Story"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let writersTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Writers"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    lazy var writersStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var storyStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var directorStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var relesedStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var runTimeStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var runTimeAndRelesedStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()

    lazy var titlAndGenreStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 600)
    
    lazy var scrollView: UIScrollView = {
        let v = UIScrollView(frame: .zero)
          v.translatesAutoresizingMaskIntoConstraints = false
          v.contentSize = contentViewSize
          v.frame = self.view.bounds
          v.autoresizingMask = .flexibleHeight
          v.showsVerticalScrollIndicator = false
          v.bounces = true
          return v
      }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame.size = contentViewSize
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpScrollView()
    }

       
    private func setUpScrollView() {
        view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    private func setUpViews() {
        view.backgroundColor = UIColor(named: "Background")

        contentView.addSubview(imageView)
        contentView.addSubview(titlAndGenreStackView)
        contentView.addSubview(runTimeAndRelesedStackView)
        contentView.addSubview(directorStackView)
        contentView.addSubview(storyStackView)
        
        titlAndGenreStackView.addSubview(movieNameLabel)
        titlAndGenreStackView.addSubview(genreLabel)
        
        relesedStackView.addSubview(relesedLabel)
        relesedStackView.addSubview(relesedLabelTitle)
        
        runTimeStackView.addSubview(runTimeLabel)
        runTimeStackView.addSubview(runTimeLabelTitle)
        
        runTimeAndRelesedStackView.addSubview(runTimeStackView)
        runTimeAndRelesedStackView.addSubview(relesedStackView)
        
        directorStackView.addSubview(directorLabel)
        directorStackView.addSubview(directorTitle)
        
        storyStackView.addSubview(storyLabel)
        storyStackView.addSubview(storyTitle)
        
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 556).isActive = true


        genreLabel.topAnchor.constraint(equalTo: titlAndGenreStackView.topAnchor, constant: 0).isActive = true
        genreLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: titlAndGenreStackView.leftAnchor, constant: 0).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: titlAndGenreStackView.rightAnchor, constant: 0).isActive = true

        movieNameLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor,constant: 0).isActive = true
        movieNameLabel.leftAnchor.constraint(equalTo: titlAndGenreStackView.leftAnchor, constant: 0).isActive = true
        movieNameLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        movieNameLabel.rightAnchor.constraint(equalTo: titlAndGenreStackView.rightAnchor, constant: 0).isActive = true
        movieNameLabel.bottomAnchor.constraint(equalTo: titlAndGenreStackView.bottomAnchor, constant: 0).isActive = true

        titlAndGenreStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 38).isActive = true
        titlAndGenreStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 18).isActive = true
        titlAndGenreStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18).isActive = true


        relesedLabelTitle.topAnchor.constraint(equalTo: relesedStackView.topAnchor, constant: 0).isActive = true
        relesedLabelTitle.leftAnchor.constraint(equalTo: relesedStackView.leftAnchor, constant: 0).isActive = true
        relesedLabelTitle.rightAnchor.constraint(equalTo: relesedStackView.rightAnchor, constant: 0).isActive = true

        relesedLabel.topAnchor.constraint(equalTo: relesedLabelTitle.bottomAnchor, constant: 5).isActive = true
        relesedLabel.leftAnchor.constraint(equalTo: relesedStackView.leftAnchor, constant: 0).isActive = true
        relesedLabel.rightAnchor.constraint(equalTo: relesedStackView.rightAnchor, constant: 0).isActive = true
        relesedLabel.bottomAnchor.constraint(equalTo: relesedStackView.bottomAnchor, constant: 0).isActive = true
        
        relesedStackView.topAnchor.constraint(equalTo: runTimeAndRelesedStackView.topAnchor, constant: 0).isActive = true
        relesedStackView.bottomAnchor.constraint(equalTo: runTimeAndRelesedStackView.bottomAnchor, constant: 0).isActive = true
        relesedStackView.leftAnchor.constraint(equalTo: runTimeAndRelesedStackView.leftAnchor, constant: 0).isActive = true
        relesedStackView.heightAnchor.constraint(equalToConstant: 38).isActive = true
        relesedStackView.widthAnchor.constraint(equalToConstant:  self.view.frame.width).isActive = true

        runTimeLabelTitle.topAnchor.constraint(equalTo: runTimeStackView.topAnchor, constant: 0).isActive = true
        runTimeLabelTitle.leftAnchor.constraint(equalTo: runTimeStackView.leftAnchor, constant: 0).isActive = true
        runTimeLabelTitle.rightAnchor.constraint(equalTo: runTimeStackView.rightAnchor, constant: 0).isActive = true

        runTimeLabel.topAnchor.constraint(equalTo: runTimeLabelTitle.bottomAnchor, constant: 5).isActive = true
        runTimeLabel.leftAnchor.constraint(equalTo: runTimeStackView.leftAnchor, constant: 0).isActive = true
        runTimeLabel.rightAnchor.constraint(equalTo: runTimeStackView.rightAnchor, constant: 0).isActive = true
        runTimeLabel.bottomAnchor.constraint(equalTo: runTimeStackView.bottomAnchor, constant: 0).isActive = true

        runTimeStackView.topAnchor.constraint(equalTo: runTimeAndRelesedStackView.topAnchor, constant: 0).isActive = true
        runTimeStackView.bottomAnchor.constraint(equalTo: runTimeAndRelesedStackView.bottomAnchor, constant: 0).isActive = true
        runTimeStackView.leftAnchor.constraint(equalTo: relesedStackView.rightAnchor, constant: 29).isActive = true
        runTimeStackView.rightAnchor.constraint(equalTo: runTimeAndRelesedStackView.rightAnchor, constant: 0).isActive = true
        runTimeStackView.heightAnchor.constraint(equalToConstant: 38).isActive = true
        runTimeStackView.widthAnchor.constraint(equalToConstant:  self.view.frame.width).isActive = true

        runTimeAndRelesedStackView.topAnchor.constraint(equalTo: titlAndGenreStackView.bottomAnchor, constant: 18).isActive = true
        runTimeAndRelesedStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 18).isActive = true
        runTimeAndRelesedStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18).isActive = true
        
        directorTitle.topAnchor.constraint(equalTo: directorStackView.topAnchor, constant: 0).isActive = true
        directorTitle.leftAnchor.constraint(equalTo: directorStackView.leftAnchor, constant: 0).isActive = true
        directorTitle.rightAnchor.constraint(equalTo: directorStackView.rightAnchor, constant: 0).isActive = true
        
        directorLabel.topAnchor.constraint(equalTo: directorTitle.bottomAnchor, constant: 5).isActive = true
        directorLabel.leftAnchor.constraint(equalTo: directorStackView.leftAnchor, constant: 0).isActive = true
        directorLabel.rightAnchor.constraint(equalTo: directorStackView.rightAnchor, constant: 0).isActive = true
        directorLabel.bottomAnchor.constraint(equalTo: directorStackView.bottomAnchor, constant: 0).isActive = true
        
        directorStackView.topAnchor.constraint(equalTo: runTimeAndRelesedStackView.bottomAnchor, constant: 18).isActive = true
        directorStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 18).isActive = true
        directorStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18).isActive = true
        
        storyTitle.topAnchor.constraint(equalTo: storyStackView.topAnchor, constant: 0).isActive = true
        storyTitle.leftAnchor.constraint(equalTo: storyStackView.leftAnchor, constant: 0).isActive = true
        storyTitle.rightAnchor.constraint(equalTo: storyStackView.rightAnchor, constant: 18).isActive = true
        
        storyLabel.topAnchor.constraint(equalTo: storyTitle.bottomAnchor, constant: 5).isActive = true
        storyLabel.leftAnchor.constraint(equalTo: storyStackView.leftAnchor, constant: 0).isActive = true
        storyLabel.rightAnchor.constraint(equalTo: storyStackView.rightAnchor, constant: 18).isActive = true
        storyLabel.bottomAnchor.constraint(equalTo: storyStackView.bottomAnchor, constant: 0).isActive = true
        
        storyStackView.topAnchor.constraint(equalTo: directorStackView.bottomAnchor, constant: 18).isActive = true
        storyStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 18).isActive = true
        storyStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18).isActive = true
        
      
    }

}


