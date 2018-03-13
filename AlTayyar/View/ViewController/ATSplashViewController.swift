//
//  ViewController.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

class ATSplashViewController: UIViewController {
    
    private let viewmodel =  ATConfigurationViewModel()
    private var movieCategoryViewModel : ATMovieCategoryViewModel!
    let segueID = "MoviesListControllerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchConfigurations()
    }

    func fetchConfigurations() {
        weak var weakSelf = self
        viewmodel.downloadData { (movieCategoryViewModel) in
            if let strongSelf = weakSelf {
                strongSelf.movieCategoryViewModel = movieCategoryViewModel
                strongSelf.performSegue(withIdentifier: strongSelf.segueID, sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Setup SplitViewController
        guard let splitViewController = segue.destination as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.topViewController as? ATMoviesListViewController,
            let rightNavController = splitViewController.viewControllers.last as? UINavigationController,
            let detailViewController = rightNavController.topViewController as? ATMoviesDetailViewController
            else { return}
        
        if ATAPPConfiguration.shared.is_iPadDevice {
            splitViewController.preferredDisplayMode = .primaryOverlay
        }
        masterViewController.delegate = detailViewController
        masterViewController.moviesViewModel = movieCategoryViewModel
        splitViewController.delegate = masterViewController
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
    }
    
}

