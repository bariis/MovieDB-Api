//
//  MovieCell.swift
//
//
//  Created by Barış Ertaş on 27.07.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    
    let movieImageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .groupTableViewBackground
        iv.contentMode = .scaleAspectFill
        return iv
    }()
//
//    lazy var movieNameContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .mainPink()
//       // movieNameLabel.font = UIFont.systemFont(ofSize: 40)
//       // movieNameLabel.adjustsFontSizeToFitWidth = true
//        view.addSubview(movieNameLabel)
//       // movieNameLabel.center(inView: view)
//        movieNameLabel.
//        return view
//    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .mainColor()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Baris Ertas"
        label.textAlignment = .center
      label.adjustsFontSizeToFitWidth = true
       label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       configureViewComponents()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with movie: Results){
        movieNameLabel.text = movie.title
      movieImageView.setImage(with: "\(Request.shared.imagePath)\(movie.poster_path)")
    }
    
    
    func configureViewComponents(){
         self.layer.cornerRadius = 10
         self.clipsToBounds = true
        
        addSubview(movieImageView)
        movieImageView.anchor(top: topAnchor, left: leftAnchor, bottom:  nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.frame.height - 36)
        
        addSubview(movieNameLabel)
        movieNameLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 36)
    }
    
    
}

