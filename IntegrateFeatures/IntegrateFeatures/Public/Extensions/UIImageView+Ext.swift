//
//  UIImage+Ext.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

extension UIImageView {
    func downloadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        })
        task.resume()
    }
}
