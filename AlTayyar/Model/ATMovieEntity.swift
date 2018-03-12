//
//  ATMovieEntity.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation

struct ATMovieEntity : Codable {
    
    let poster_path : String?
    let backdrop_path : String?
    let overview : String?
    let release_date : String?
    let original_title : String?
    let original_language : String?
    let title : String?
    let popularity : Double?
    let vote_count : Int?
    let adult : Bool?
    let video : Bool?
    let vote_average : Double?
    let genre_ids : [Int]?
    let id : Int?
    
    
}
