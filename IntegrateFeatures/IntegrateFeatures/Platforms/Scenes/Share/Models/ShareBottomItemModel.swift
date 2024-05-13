//
//  ShareBottomItemModel.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

struct ShareBottomViewItemModel {
    var image: UIImage
    var content: String
    init(type: EShareType) {
        self.image = UIImage(named: type.rawValue) ?? UIImage()
        self.content = type.content
    }
}
