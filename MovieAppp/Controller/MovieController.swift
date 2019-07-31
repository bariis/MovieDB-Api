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
    var filteredMovies = [Results]()
    
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewComponents()
        fetchMovie()
        searchBarImplementation()
        
    }
    
    // API
    
    func fetchMovie(){
        
        Request.shared.fetchData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieInfo):
                self.movies = movieInfo
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
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
    
     let searchController = UISearchController(searchResultsController: nil)
    
    func searchBarImplementation(){
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        searchController.searchBar.tintColor = .black
        searchController.searchBar.isTranslucent = false
        searchController.searchBar.backgroundColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String, scope: String = "All"){
        filteredMovies = movies.filter({ (movie: Results) -> Bool in
            return movie.title.lowercased().contains(searchText.lowercased())

        })

        collectionView.reloadData()
    }

}


extension MovieController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if isFiltering(){
            return filteredMovies.count
        }
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCell
        
        let movie: Results
        if isFiltering(){
            movie = filteredMovies[indexPath.row]
        }
        else{
            movie = movies[indexPath.row]
        }

        cell.setup(with: movie)
        return cell

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = MovieDetailsController()
        navigationController?.pushViewController(controller, animated: true)
   
        let movie: Results
        if isFiltering(){
            movie = filteredMovies[indexPath.row]
        }else{
            movie = movies[indexPath.row]
        }
       
       controller.setupDetails(with: movie)
        
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

extension MovieController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}


