//
//  HomeVC.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import UIKit
import PagingTableView

protocol HomeView : UIViewController{
    var tableView: PagingTableView! { get }
}
class HomeVC: UIViewController, HomeView {
    @IBOutlet weak var tableView: PagingTableView!
    var viewModel: HomeVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.view = self
    }
    class func `init`() ->HomeVC {
        let vc = UIStoryboard.home.instanceOf(viewController: HomeVC.self)!
        vc.viewModel = HomeVM()
        return vc
    }
}
