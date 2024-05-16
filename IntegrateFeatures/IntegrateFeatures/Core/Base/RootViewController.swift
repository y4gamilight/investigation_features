//
//  RootViewController.swift
//  IntegrateFeatures
//
//  Created by  Lê Thành on 15/05/2024.
//

import UIKit

class RootViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let rootVC = Storyboard.main.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        rootVC.navigator = NavigatorImpl(navController: self)
        viewControllers = [rootVC]
    }
}
