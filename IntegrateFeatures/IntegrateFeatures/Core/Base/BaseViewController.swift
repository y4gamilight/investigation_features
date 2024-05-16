//
//  BaseViewController.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 15/05/2024.
//

import UIKit

class BaseViewController: UIViewController {
    var navigator: Navigator!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bindData()
        bindEvent()
        configuration()
    }
    func setup() { }
    func bindData() { }
    func bindEvent() { }
    func configuration() { }
}
