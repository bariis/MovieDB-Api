//
//  API.swift
//  MovieAppp
//
//  Created by Barış Ertaş on 27.07.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class Request {
  
    let Base_URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=883a273f2209782464db67ece72bd299&language=en-US"
    
    let imagePath = "https://image.tmdb.org/t/p/w500"
    let ornek = "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"
    
    static let shared = Request()
    
//    func fetchMovie(completion: @escaping ([Movie]?, Error?) -> Void ){
//
//      //  var movie = [Movie]()
//
//        guard let url = URL(string: Base_URL) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            //handle error
//            if let error = error {
//                print("Failed to fetch data with error: ", error.localizedDescription)
//                completion(nil,error)
//                return
//            }
//
//            guard let jsonData = data else {
//                print("asdasdas")
//                return }
//
//            do{
////                guard let resultArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [AnyObject] else { return }
//
//                let movie = try JSONDecoder().decode([Movie].self, from: jsonData)
//
//               //movie.append(resultArray)
//
//                completion(movie,nil)
//
//            }catch let error {
//                print("Failed to create json with error ", error.localizedDescription)
//            }
//        }.resume()
//    }
    
    
    func fetchData(completion: @escaping (Result<[Results],Error>) -> ()){
     
        guard let url = URL(string: Base_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //handle error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let jsonData = data else {return }
            
            do{
                //                guard let resultArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [AnyObject] else { return }
                
                let movie = try JSONDecoder().decode(Movie.self, from: jsonData)
                let movieInfo = movie.results
                
                completion(.success(movieInfo))
                
            }catch let error {
                completion(.failure(error))
            }
            
            
            }.resume()
        
        
        
    }
    
     func fetchImage(with url: String, completion: @escaping (Result<UIImage,Error>) -> Void){
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch image with error ", error)
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            completion(.success(image))
            
        }.resume()
    }
    
}
