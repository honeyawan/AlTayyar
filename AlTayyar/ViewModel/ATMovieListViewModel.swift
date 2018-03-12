//
//  ATMovieListViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
class ATMovieListViewModel {
    
    private var movies = [ATMovieEntity]()
    private let movieIdentifier : String
    
    // To check if more items can be fetched
    private var canLoadMore : Bool = true
    
    /// This is to avoid multiple calls.
    /// It will stop second call execution untill the response of first is returned
    private var isLoadingData : Bool = false
    
    private var page = 1
    private let pageSize = 20
    
    private var selectedMovie : ATMovieEntity?
    
    func numberOfMovies()->Int {
        return movies.count
    }
    
    func movieSelectedAtIndexPath(_ indexPath : IndexPath) {
        selectedMovie = movies[indexPath.row]
    }
    
    
    func shouldLoadMoreMovies(indexPath : IndexPath)-> Bool {
        return ((numberOfMovies() - 6) == indexPath.row  && canLoadMore && !isLoadingData)
    }
    
    func imageForMovieAtIndexPath(indexPath : IndexPath) -> String {
        if indexPath.count < movies.count {
            let movie = movies[indexPath.row]
            return ATAPPConfiguration.shared.urlForMovieLogo(logoId: movie.poster_path ?? "")
        }
        return ""
    }
    
    init(movieIdentifier : String) {
        self.movieIdentifier = movieIdentifier
    }
    
    func fetchMovies(_ completion : @escaping ((_ succes :Bool)->Void)) {
        isLoadingData = true
        weak var weakSelf = self
        ATFetchMoviesService().getMoviesForCategoryIdentifier(movieIdentifier, page: page) { (movies) in
            if let strongSelf = weakSelf {
                if let newMovies = movies {
                    strongSelf.canLoadMore = newMovies.count >= strongSelf.pageSize
                    strongSelf.isLoadingData = false
                    strongSelf.movies.append(contentsOf: newMovies)
                    strongSelf.page = strongSelf.page + 1
                }
                completion(true)
            }
        }
    }
    
}
