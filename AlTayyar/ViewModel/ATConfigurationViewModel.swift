//
//  ATConfigurationViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation

class ATConfigurationViewModel {
    
    func getConfiguration(completion : @escaping (()->Void)) {
        let service = ATAPIConfigurationService()
        service.getApiConfigurations(completion: completion)
    }
}
