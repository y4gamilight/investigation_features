//
//  UIView+Extension.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

extension UIView {
   func dropShadow() {
       layer.masksToBounds = false
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOpacity = 0.5
       layer.shadowOffset = CGSize(width: -1, height: 1)
       layer.shadowRadius = 1
       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       layer.shouldRasterize = true
       layer.rasterizationScale = UIScreen.main.scale
   }
}

extension UIView {
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img ?? UIImage()
    }
}
