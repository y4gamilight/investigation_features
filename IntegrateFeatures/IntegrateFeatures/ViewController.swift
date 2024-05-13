//
//  ViewController.swift
//  Share
//
//  Created by  [Weak Self] on 11/05/2024.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func clickOpenShareView(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReliaShareVC") else { return }
//        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}


