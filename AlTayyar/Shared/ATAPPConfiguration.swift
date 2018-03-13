//
//  ATAPPConfiguration.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
import UIKit

class ATAPPConfiguration {
   
    let apiKey = "114fe6670282f6a632638661e5e86dee"
    let baseUrl = "https://api.themoviedb.org/3"
    
    let is_iPadDevice = UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiom.pad


    
    static let shared = ATAPPConfiguration()
    private init() {
    }

    
    // Initiallizing with Default Values
    private var apiConfiguration = ATAPIConfiguration.init(baseUrl: "http://image.tmdb.org/t/p/", secureBaseURL: "https://image.tmdb.org/t/p/", posterSizes: ["original"], logoSizes: ["original"] , backdropSizes : ["w300"])

    
   private var logoSize : String {
        return apiConfiguration.logoSizes?.first ?? ""
    }
    
    // Pick the lightest image to download quickly
   private var backDropSizes : String {
        return apiConfiguration.backdropSizes?.first ?? ""
    }
    
    
    // Pick the lightest image to download quickly
    private var posterSize : String {
        return apiConfiguration.posterSizes?.first ?? ""
    }

   private var imageBaseUrl : String {
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

