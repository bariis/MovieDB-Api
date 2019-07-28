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
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let movieNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.text = "Baris Ertas"
        label.backgroundColor = .groupTableViewBackground
        return label
    }()
    
    let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    
    func configureViewComponents(){
        view.backgroundColor = .yellow
        navigationController?.navigationBar.tintColor = .green
        
        view.addSubview(movieDetailImageView)
        movieDetailImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 250, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height / 2 - 200)
        
        
        view.addSubview(movieNameLabel)
        movieNameLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: view.frame.height / 2 - 30, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: view.frame.width, height: 30)
        
        view.addSubview(movieInfoLabel)
        movieInfoLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: view.frame.height / 2 + 20
            , paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: view.frame.width, height: 150)
        
    }
    
    
}
