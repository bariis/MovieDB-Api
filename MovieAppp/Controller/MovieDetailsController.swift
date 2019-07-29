//
//  MovieDetailsController.swift
//  MovieAppp
//
//  Created by Barış Ertaş on 27.07.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {
    
    let movieDetailImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .groupTableViewBackground
        
        return iv
    }()
    
    let movieNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.sizeToFit()
        label.numberOfLines  = 0
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.sizeToFit()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    
    func configureViewComponents(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(movieDetailImageView)
        movieDetailImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width:0, height: view.frame.height / 2 - 50 )
        
        
        view.addSubview(movieNameLabel)
        movieNameLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: view.frame.height / 2 + 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: view.frame.width, height: 30)
        
        view.addSubview(movieInfoLabel)
        movieInfoLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: view.frame.height / 2 + 50
            , paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: view.frame.width, height: 150)
        
    }
}
