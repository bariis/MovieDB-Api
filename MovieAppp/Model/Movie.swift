//
//  Movie.swift
//  MovieAppp
//
//  Created by Barış Ertaş on 27.07.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit


struct Movie: Decodable {
    
    let results: [Results]
}

struct Results: Decodable {
    let title: String
    let poster_path: String
    let overview: String
}

