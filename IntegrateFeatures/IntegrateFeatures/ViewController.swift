//
//  ViewController.swift
//  Share
//
//  Created by  [Weak Self] on 11/05/2024.
//

import UIKit

class ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func clickOpenShareView(_ sender: Any) {
        navigator.presentReliaShareScreen()
    }
    
    @IBAction func clickOpenNativeAdView(_ sender: Any) {
        navigator.presentReliaNativeAdScreen()
    }
}


