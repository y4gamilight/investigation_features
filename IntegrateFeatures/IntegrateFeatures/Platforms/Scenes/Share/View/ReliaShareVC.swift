//
//  ReliaShareVC.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import Foundation
import UIKit

class ReliaShareVC: UIViewController {
    private lazy var navBar: NavBarView = {
        let view = NavBarView()
        view.prepareData(title: "Share", backIcon: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shareView: ShareView = {
        let view = ShareView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomView: ShareBottomView = {
        let view = ShareBottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .black
        [navBar, shareView, bottomView].forEach( view.addSubview(_:) )
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 64),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            shareView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            shareView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shareView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bottomView.topAnchor.constraint(equalTo: shareView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 280),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        bottomView.loadData()
    }
}
