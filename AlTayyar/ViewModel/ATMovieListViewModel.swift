//
//  ATMovieListViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
struct ATMovieListViewModel {
    
    var movies = [ATMovieEntity]()
    let movieIdentifier : String
    var loadMore : Bool = false
    var page = 1
    
    func numberOfMovies()->Int {
        return movies.count
    }
    
    func shouldLoadMoreMovies(indexPath : IndexPath)-> Bool {
        return ((numberOfMovies() - 6) == indexPath.row  && loadMore)
    }
    
    func imageForMovieAtIndexPath(indexPath : IndexPath) -> String {
        return ""
    }
    
    init(movieIdentifier : String) {
        self.movieIdentifier = movieIdentifier
    }
    
    mutating func fetchMovies(_ completion : ((_ succes :Bool)->Void)) {
        loadMore = true
        completion(true)
    }
    
    
    
    
}
