//
//  ATMoviesDetailViewController.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

class ATMoviesDetailViewController: UIViewController {

    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var viewModel: ATMovieDetailViewModel? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        
        if let model = viewModel {
            txtView.text = model.descriptionForMovieDetail
            lblTitle.text = model.titleForMovieDetail
            lblRatings.text = model.titleForRating
            imageView.image = nil
            
            let imageID = model.imageForMovieDetail()
            if let url = URL.init(string: imageID) {
                imageView.af_setImage(withURL: url)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      txtView.text =  "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ATMoviesDetailViewController : MovieSelectionDelegate {
    func movieSelected(viewModel: ATMovieDetailViewModel) {
        self.viewModel = viewModel
    }
}


