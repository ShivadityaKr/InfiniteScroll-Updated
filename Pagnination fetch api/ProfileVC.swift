//
//  ProfileVC.swift
//  TrainingDemoProject
//
//  Created by Sandeep on 14/02/22.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    class func `init`() -> ProfileVC {
        let vc = UIStoryboard.home.instanceOf(viewController: ProfileVC.self)!
        return vc
    }

}
