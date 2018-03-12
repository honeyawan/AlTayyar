//
//  ViewController.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

class ATSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchConfigurations()
    }

    func fetchConfigurations() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performSegue(withIdentifier: "MoviesListControllerId", sender: nil)

    }


}

