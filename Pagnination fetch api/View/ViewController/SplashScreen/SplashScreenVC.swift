//
//  SplashScreenVC.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import UIKit

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadScreen()
        // Do any additional setup after loading the view.
       
    }
    func loadScreen(){
        let vc = HomeVC.`init`()
        UIStoryboard.makeNavigationControllerAsRootVC(vc)
    }
    

}
