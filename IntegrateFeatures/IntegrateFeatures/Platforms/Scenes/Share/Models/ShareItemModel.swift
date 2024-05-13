//
//  ShareItemModel.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 13/05/2024.
//

import Foundation

struct ShareItemModel {
    let publisherName: String
    let iconUrl: String
    let title: String
    let content: String
    
    init(publisherName: String = "",
         iconUrl: String = "",
         title: String = "",
         content: String = "") {
        self.publisherName = publisherName
        self.title = title
        self.iconUrl = iconUrl
        self.content = content
    }
}
