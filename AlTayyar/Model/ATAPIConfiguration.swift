//
//  ATAPIConfiguration.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
struct ATAPIConfiguration : Codable {
    
    let baseUrl : String?
    let secureBaseURL : String?
    let posterSizes : [String]?
    let logoSizes : [String]?
    
    private enum CodingKeys : String , CodingKey {
        case baseUrl = "base_url"
        case secureBaseURL = "secure_base_url"
        case posterSizes = "poster_sizes"
        case logoSizes = "logo_sizes"
    }
    
    func urlForMoviePoster(posterID : String) -> String {
        return ""
    }
    
    func urlForMovieLogo(logoId : String) -> String {
        return ""
    }
}

