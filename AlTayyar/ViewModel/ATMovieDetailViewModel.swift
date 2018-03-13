//
//  ATMovieDetailViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
struct ATMovieDetailViewModel {
    
   private var movie : ATMovieEntity!

    init(movie : ATMovieEntity) {
        self.movie = movie
    }
    
    
    func imageForMovieDetail() -> String {
        return ATAPPConfiguration.shared.urlForMovieBackDrop(posterID: movie.backdrop_path ?? "")
    }
    
    var titleForMovieDetail : String {
        return movie.title ?? ""
    }
    
    var titleForRating : String {
        return "\(ratings) Ratings"
    }

    
    var descriptionForMovieDetail : String {
        return movie.overview ?? ""
    }
    
    var ratings : Double {
        return movie.vote_average ?? 0
    }
    
}
