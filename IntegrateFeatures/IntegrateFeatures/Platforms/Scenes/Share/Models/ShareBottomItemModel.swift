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
    var type: EShareType
    init(type: EShareType) {
        self.image = type.image
        self.content = type.content
        self.type = type
    }
}
