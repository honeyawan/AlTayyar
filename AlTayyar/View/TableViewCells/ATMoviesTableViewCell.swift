//
//  ATMoviesTableViewCell.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

class ATMoviesTableViewCell: UITableViewCell {

    
    let collectionCellID = "MovieCollectionCellID"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ATMoviesTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath)
        return cell
    }
    
    
    
    
    
}
