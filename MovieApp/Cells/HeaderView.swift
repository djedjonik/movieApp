//
//  HeaderView.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 01.02.2021.
//
import UIKit
import Foundation

class HeaderView: UICollectionReusableView {
    
    let headerLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Movies"
        textLabel.font = UIFont(name: "HelveticaNeue", size: 32.0)
        return textLabel
    }()
    
    let subHeaderLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "The library of my favourite movies"
        textLabel.font = UIFont(name: "HelveticaNeue", size: 16.0)
        return textLabel
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10.0
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(stackView)
        
        stackView.addSubview(headerLabel)
        stackView.addSubview(subHeaderLabel)
        
        addConstrainsWithFormat(format: "H:|-36-[v0]-98-|", views: stackView)
        
        addConstrainsWithFormat(format: "V:|-36-[v0]|", views: stackView)
        
        addConstrainsWithFormat(format: "V:|[v0]-10-[v1]|", views: headerLabel,subHeaderLabel)
        
           }
    }
