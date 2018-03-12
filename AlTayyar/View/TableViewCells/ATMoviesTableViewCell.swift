//
//  ATMoviesTableViewCell.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit
import AlamofireImage

class ATMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ATMovieListViewModel(movieIdentifier: "identifier")
    let collectionCellID = "MovieCollectionCellID"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setIdentifier(_ identifier : String) {
        
        collectionView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: false)
        viewModel = ATMovieListViewModel(movieIdentifier: identifier)
        getMoreMovies()
    }
    
    func getMoreMovies(){
        
        viewModel.fetchMovies { (success) in
            self.collectionView.reloadData()
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    

}
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.shouldLoadMoreMovies(indexPath: indexPath) {
            getMoreMovies()
        }
    }
    
    
}
