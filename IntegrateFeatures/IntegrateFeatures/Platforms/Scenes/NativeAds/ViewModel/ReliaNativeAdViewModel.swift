//
//  ReliaNativeAdViewModel.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 30/05/2024.
//

import Foundation

class ReliaNativeAdViewModel: NSObject{
    var onLoadTableCell: (([ReliaNativeCellItem]) -> Void)?
    var onLoadCollectionCell: (([ReliaNativeCollectionItem]) -> Void)?
    var
    func loadData() {
        loadCellItems()
        loadCollectionItems()
    }
    
    private func loadCellItems() {
        var items: [ReliaNativeCellItem] = []
        
        for i in 1...30 {
            let title = "Title \(i)"
            let subTitle = "Subtitle \(i)"
            let item = ReliaNativeCellItem(title: title, subTitle: subTitle)
            items.append(item)
        }
        
        onLoadTableCell?(items)
    }
    
    private func loadCollectionItems() {
        
        var items: [ReliaNativeCollectionItem] = []
        
        for i in 1...30 {
            let title = "Title Collection \(i)"
            let subTitle = "Subtitle Collection \(i)"
            let item = ReliaNativeCollectionItem(title: title, subTitle: subTitle)
            items.append(item)
        }
        
        onLoadCollectionCell?(items)
    }
}
