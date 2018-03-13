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
    @IBOutlet weak var lblSelectMovie: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var viewModel: ATMovieDetailViewModel? {
        didSet {
            self.refreshUI()
        }
    }
    
   private func refreshUI() {
        
        self.view.backgroundColor = UIColor.white
        if let model = viewModel {
            lblSelectMovie.isHidden = true
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
}

// MARK: MovieSelectionDelegate
extension ATMoviesDetailViewController : MovieSelectionDelegate {
    func movieSelected(viewModel: ATMovieDetailViewModel) {
        self.viewModel = viewModel
    }
}


