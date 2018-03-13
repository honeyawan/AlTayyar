//
//  ViewController.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

class ATSplashViewController: UIViewController {
    
    let viewmodel =  ATConfigurationViewModel()
    let segueID = "MoviesListControllerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchConfigurations()
    }

    func fetchConfigurations() {
        weak var weakSelf = self
        viewmodel.getConfiguration {
            if let strongSelf = weakSelf {
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
        
        
        masterViewController.delegate = detailViewController
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem

        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }


}

