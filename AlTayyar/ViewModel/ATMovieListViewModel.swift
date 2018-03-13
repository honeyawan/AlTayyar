//
//  ATMovieListViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
@objc class ATMovieListViewModel : NSObject{
    
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
    
    
    init(movieIdentifier : String) {
        self.movieIdentifier = movieIdentifier
    }

    
    func numberOfMovies()->Int {
        return movies.count
    }
    
    var isFirstPage : Bool {
        return page == 1
    }
    
    func movieSelectedAtIndexPath(_ indexPath : IndexPath) {
        selectedMovie = movies[indexPath.row]
    }
    
    func getDetailViewModelForSelectedMovie() -> ATMovieDetailViewModel? {
        
        if let movie = selectedMovie {
            return ATMovieDetailViewModel(movie: movie)
        }
        
        return nil
        
    }
    
    func shouldLoadMoreMovies(indexPath : IndexPath)-> Bool {
        return ((numberOfMovies() - 6) == indexPath.row  && canLoadMore && !isLoadingData)
    }
    
    func imageForMovieAtIndexPath(indexPath : IndexPath) -> String {
        if indexPath.count < movies.count {
            let movie = movies[indexPath.row]
            return ATAPPConfiguration.shared.urlForMoviePoster(posterPath: movie.posterPath ?? "")
        }
        return ""
    }
    
    func fetchMovies(_ completion : @escaping (()->Void)) {
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
                completion()
            }
        }
    }
    
}
