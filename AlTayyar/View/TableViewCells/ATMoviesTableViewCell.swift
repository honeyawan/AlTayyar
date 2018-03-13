//
//  ATMoviesTableViewCell.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit
import AlamofireImage

protocol ATMoviesTableViewCellDelegate {
    func movieCellDidSelectedMovie(detailViewModel : ATMovieDetailViewModel)
}

class ATMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainSpinner: UIActivityIndicatorView!
    @IBOutlet weak var rightSpinner: UIActivityIndicatorView!


    var cellDelegate : ATMoviesTableViewCellDelegate?
    var viewModel = ATMovieListViewModel(movieIdentifier: "identifier")
    let collectionCellID = "MovieCollectionCellID"
    
    
    func setIdentifier(_ identifier : String) {
        // Re-usable TableView Cell needs to fetch New movies
        collectionView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        viewModel = ATMovieListViewModel(movieIdentifier: identifier)
        getMoreMovies()
    }
    
   private func getMoreMovies() {
        weak var weakSelf = self
        showLoading()
        viewModel.fetchMovies { () in
            if let strongSelf = weakSelf {
                strongSelf.hideLoading()
                strongSelf.collectionView.reloadData()
            }
        }
    }
    
   private func showLoading() {
        if viewModel.isFirstPage {
            mainSpinner.isHidden = false
            mainSpinner.startAnimating()
        }
        else {
            rightSpinner.isHidden = false
            rightSpinner.startAnimating()
        }
    }
    
   private func hideLoading() {
        rightSpinner.isHidden = true
        mainSpinner.isHidden = true

    }
}

// MARK: UICollectionViewDelegate UICollectionViewDataSource
extension ATMoviesTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ATMoviesCollectionViewCell
        cell.imageView.image = nil
        let imageID = viewModel.imageForMovieAtIndexPath(indexPath: indexPath)
        if let url = URL.init(string: imageID) {
            cell.imageView.af_setImage(withURL: url)
        }
        return cell
    }
    
    
    // Check and Fetch next Page of Movies
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.shouldLoadMoreMovies(indexPath: indexPath) {
            getMoreMovies()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.movieSelectedAtIndexPath(indexPath)
        if let delegate = cellDelegate , let detailViewModel = viewModel.getDetailViewModelForSelectedMovie() {
            delegate.movieCellDidSelectedMovie(detailViewModel: detailViewModel)
        }
    }
    
}
