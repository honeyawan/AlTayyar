//
//  ATMoviesListViewController.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

protocol MovieSelectionDelegate: class {
    func movieSelected(viewModel: ATMovieDetailViewModel)
}

class ATMoviesListViewController: UITableViewController {
        
    private let cellID = "MoviesTypeCellD"
    let moviesViewModel = ATMovieCategoryViewModel()
    weak open var delegate: MovieSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


//MARK : UITableViewDelegate,UITableViewDataSource
extension ATMoviesListViewController  {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return moviesViewModel.numberOfCategories()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ATMoviesTableViewCell
        cell.setIdentifier(moviesViewModel.identifierForSection(indexPath.section))
        cell.cellDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return moviesViewModel.titleForSection(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text =  "  \(moviesViewModel.titleForSection(section))"
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.backgroundColor = UIColor.white
        return label
    }
    
}

extension ATMoviesListViewController : ATMoviesTableViewCellDelegate {
    
    func movieCellDidSelectedMovie(detailViewModel : ATMovieDetailViewModel) {
        if let detailViewController = delegate as? ATMoviesDetailViewController,
            let detailNavigationController = detailViewController.navigationController ,  let spltViewController = self.splitViewController{
            detailViewController.movieSelected(viewModel : detailViewModel)
            spltViewController.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
}

extension ATMoviesListViewController : UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

