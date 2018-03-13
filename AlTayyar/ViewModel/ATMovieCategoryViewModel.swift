//
//  ATMovieCategoryViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
struct ATMovieCategoryViewModel {
    
    let categories : [(name : String , identifier : String)] =
        [
            ("Popularity" , "popularity.desc"),
            ("Revenue" , "revenue.desc"),
            ("Top Rated" , "vote_average.desc"),
            ("Release Date" , "release_date.desc"),
            ("A - Z" , "original_title.asc"),
            ("Most Voted" , "vote_count.desc")
            
    ]
    
    var listViewModels = [ATMovieListViewModel]()
    
    func numberOfCategories()->Int {
        return categories.count
    }
    
    func titleForSection(_ section : Int) -> String {
        return categories[section].name
    }
    
    func identifierForSection (_ section : Int)-> String {
        return categories[section].identifier
    }
    
}
