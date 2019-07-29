//
//  MovieController.swift
//  MovieApp
//
//  Created by Barış Ertaş on 27.07.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MovieCell"

class MovieController: UICollectionViewController {
    
    // MARK: - Properties
    
    var movies = [Results]()
    var movieImages = [UIImage]()
    let message = "baris ertas"
 
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewComponents()
        fetchMovie()
    }
    
    // API
    
    func fetchMovie(){
        
        Request.shared.fetchData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieInfo):
                
                    self.movies = movieInfo
                    self.movies.forEach({ (movie) in
                        
                        let url = Request.shared.imagePath + movie.poster_path
                        
                        Request.shared.fetchImage(with: url, completion: { (result) in
                        
                            switch result {
                            case .failure(let error):
                                print(error)
                            case .success(let image):
                                self.movieImages.append(image)
                                
                                DispatchQueue.main.async {
                                   self.collectionView.reloadData()
                                }
                            }
                        })
                    })
            }
        }
    }

    
    // MARK: - Helper Functions
    
    func configureViewComponents(){
        
        collectionView.backgroundColor = .rgb(red: 72, green: 61, blue: 139)
        
        navigationController?.navigationBar.barTintColor = .mainColor()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Now Showing Movies"

        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
}


extension MovieController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
      
        cell.movieNameLabel.text = movies[indexPath.row].title
        cell.movieImageView.image = movieImages[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = MovieDetailsController()
        navigationController?.pushViewController(controller, animated: true)
   
       let movie = movies[indexPath.row]

        controller.movieInfoLabel.text = movie.overview
        controller.movieNameLabel.text = movie.title
        controller.movieDetailImageView.image = movieImages[indexPath.item]
        
    
    }
    
    
}

extension MovieController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 24, left: 8, bottom: 8, right: 8)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 2
        let height = (view.frame.height / 2) - 45
        return CGSize(width: width, height: height)
    }
}




