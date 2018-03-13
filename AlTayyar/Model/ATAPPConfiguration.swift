//
//  ATAPPConfiguration.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
class ATAPPConfiguration {
    
    static let shared = ATAPPConfiguration()
    private init() {}

    let apiKey = "114fe6670282f6a632638661e5e86dee"
    let baseUrl = "https://api.themoviedb.org/3"
    
    // Initiallizing with Default Values
    var apiConfiguration = ATAPIConfiguration.init(baseUrl: "http://image.tmdb.org/t/p/", secureBaseURL: "https://image.tmdb.org/t/p/", posterSizes: ["original"], logoSizes: ["original"] , backdropSizes : ["w300"])

    
    var logoSize : String {
        return apiConfiguration.logoSizes?.first ?? ""
    }
    
    // Pick the lightest image to download quickly
    var backDropSizes : String {
        return apiConfiguration.backdropSizes?.first ?? ""
    }
    
    
    // Pick the lightest image to download quickly
    var posterSize : String {
        return apiConfiguration.posterSizes?.first ?? ""
    }

    var imageBaseUrl : String {
        return apiConfiguration.secureBaseURL ?? ""
    }
    
    func urlForMoviePoster(posterPath : String) -> String {
        return "\(self.imageBaseUrl)\(self.posterSize)\(posterPath)"
    }
    
    func urlForMovieBackDrop(posterID : String) -> String {
        return "\(self.imageBaseUrl)\(backDropSizes)\(posterID)"
    }
    
    func updateConfiguration(config : ATAPIConfiguration?) {
        if let configuration = config {
            self.apiConfiguration = configuration
        }
    }
}

