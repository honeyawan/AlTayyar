//
//  ATMoviesListViewController.swift
//  AlTayyar
//
//  Created by Haneef Habib on 3/12/18.
//  Copyright © 2018 AlTayyar. All rights reserved.
//

import UIKit

class ATMoviesListViewController: UITableViewController {
    
    
    private let cellID = "MoviesTypeCellD"
    let moviesViewModel = ATMovieCategoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController!.delegate = self
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
    func movieCellDidSelectedMovie() {
//        self.splitViewController?.showDetailViewController(<#T##vc: UIViewController##UIViewController#>, sender: nil)
    }
}

extension ATMoviesListViewController : UISplitViewControllerDelegate {
    
    
    func splitViewController(_ splitViewController: UISplitViewController, show vc: UIViewController, sender: Any?) -> Bool {
        return true
    }
    

    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
        return true
    }

}

