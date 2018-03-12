//
//  ATMovieListViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
class ATMovieListViewModel {
    
    var movies = [ATMovieEntity]()
    let movieIdentifier : String
    var loadMore : Bool = false
    var page = 1
    let pageSize = 20
    
    func numberOfMovies()->Int {
        return movies.count
    }
    
    func shouldLoadMoreMovies(indexPath : IndexPath)-> Bool {
        return ((numberOfMovies() - 6) == indexPath.row  && loadMore)
    }
    
    func imageForMovieAtIndexPath(indexPath : IndexPath) -> String {
        if indexPath.count < movies.count {
            let movie = movies[indexPath.row]
            return ATAPPConfiguration.shared.urlForMovieLogo(logoId: movie.backdrop_path ?? "")
        }
        return ""
    }
    
    init(movieIdentifier : String) {
        self.movieIdentifier = movieIdentifier
    }
    
    func fetchMovies(_ completion : @escaping ((_ succes :Bool)->Void)) {
        loadMore = true
        weak var weakSelf = self
        ATFetchMoviesService().getMoviesForCategoryIdentifier(movieIdentifier, page: page) { (movies) in
            if let strongSelf = weakSelf {
                if let newMovies = movies {
                    strongSelf.loadMore = newMovies.count >= strongSelf.pageSize
                    strongSelf.movies.append(contentsOf: newMovies)
                    strongSelf.page = strongSelf.page + 1
                }
                completion(true)
            }
        }
    }
    
    
    
    
}
