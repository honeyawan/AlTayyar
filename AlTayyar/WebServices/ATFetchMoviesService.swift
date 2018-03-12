//
//  ATFetchMoviesService.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation

import Alamofire


struct MovieTempObject : Codable {
    let total_results : Int?
    let total_pages : Int?
    let results : [ATMovieEntity]?
    
}



struct ATFetchMoviesService {
    
    func getMoviesForCategoryIdentifier(_ identifier : String , page : Int , completion : @escaping ((_ movies : [ATMovieEntity]?)->Void)) {
        let request = Alamofire.request("\(ATAPPConfiguration.shared.baseUrl)/discover/movie?api_key=\(ATAPPConfiguration.shared.apiKey)&language=en-US&sort_by=\(identifier)&include_adult=false&include_video=false&page=\(page)", method: .get, parameters: nil , encoding: URLEncoding.default, headers:nil)
        request.responseString { (response) in
            var movies : [ATMovieEntity]?
            if let data = response.data {
                let responseData = try? JSONDecoder().decode(MovieTempObject.self, from: data)
                movies = responseData?.results
            }
            DispatchQueue.main.async {
                completion(movies)
            }
        }
    }
}
