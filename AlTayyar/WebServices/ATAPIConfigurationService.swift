//
//  ATAPIConfigurationService.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation
import Alamofire

// Private Sturcture to Parse Json with Codable
private struct ATAPIConfigurationResponse : Codable {
    let images : ATAPIConfiguration?
}



struct ATAPIConfigurationService {
    
    func getApiConfigurations(completion : @escaping ((_ configuration : ATAPIConfiguration?)->Void)) {
        let request = Alamofire.request("\(ATAPPConfiguration.shared.baseUrl)/configuration?api_key=\(ATAPPConfiguration.shared.apiKey)", method: .get, parameters: nil , encoding: URLEncoding.default, headers:nil)
        request.responseString { (response) in
            var apiConfig : ATAPIConfiguration?
            if let data = response.data {
                let responseData = try? JSONDecoder().decode(ATAPIConfigurationResponse.self, from: data)
                apiConfig = responseData?.images
            }
            DispatchQueue.main.async {
                completion(apiConfig)
            }
            
        }
    }
}
