//
//  ATConfigurationViewModel.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import Foundation

class ATConfigurationViewModel {
    
    func downloadData(completion : @escaping ((_ movieCategoryViewModel : ATMovieCategoryViewModel)->Void)) {
        
        let dispatchGroup = DispatchGroup()
        var movieCategoryViewModel = ATMovieCategoryViewModel()
        for category in movieCategoryViewModel.categories {
            dispatchGroup.enter()
            let model = ATMovieListViewModel.init(movieIdentifier: category.identifier)
            model.fetchMovies({
                movieCategoryViewModel.listViewModels.append(model)
                dispatchGroup.leave()
            })
        }
        dispatchGroup.enter()
        let service = ATAPIConfigurationService()
        service.getApiConfigurations { (apiConfig) in
            ATAPPConfiguration.shared.updateConfiguration(config: apiConfig)
            dispatchGroup.leave()

        }
        dispatchGroup.notify(queue: .main) {
            completion(movieCategoryViewModel)
        }
    }
}
