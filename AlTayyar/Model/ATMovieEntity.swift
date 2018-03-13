//
//  ATMovieEntity.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation

struct ATMovieEntity : Codable {
    
    let posterPath : String?
    let backdropPath : String?
    let overview : String?
    let releaseDate : String?
    let originalTitle : String?
    let originalLanguage : String?
    let title : String?
    let popularity : Double?
    let voteCount : Int?
    let adult : Bool?
    let video : Bool?
    let voteAverage : Double?
    let genreIds : [Int]?
    let identifier : Int?
    
    
    private enum CodingKeys : String , CodingKey {
        
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview = "overview"
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title = "title"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case adult = "adult"
        case video = "video"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
        case identifier = "id"
        
        
    }

    
    
}
