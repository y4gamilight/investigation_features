//
//  ShareBottomViewDataSource.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

class ShareBottomViewDataSource: NSObject {
    private enum Constants {
        static let numOfItems = 3
        static let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
    }
    var onSelectShareType:((EShareType) -> ())?
    
    private var items: [ShareBottomViewItemModel] = []
    func update(items: [ShareBottomViewItemModel]) {
        self.items = items
    }
    
    
    
    fileprivate func getItemsPerSection(_ section: Int) -> [ShareBottomViewItemModel] {
        let itemsPerRow = Constants.numOfItems
        
        let from = section * itemsPerRow
        var to = (section * itemsPerRow) + itemsPerRow
        if items.count < to {
            to = items.count
        }
        return Array(items[from..<to])
    }
}

extension ShareBottomViewDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let delta = items.count % Constants.numOfItems
        return ((items.count - delta) / Constants.numOfItems) + (delta > 0 ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getItemsPerSection(section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = getItemsPerSection(indexPath.section)[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareBottomViewCell", for: indexPath) as! ShareBottomViewCell
        cell.model = model
        return cell
    }
    
}

extension ShareBottomViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        
        let paddingSpace = Constants.sectionInsets.left * CGFloat(Constants.numOfItems + 1)
        let availableWidth = screenWidth - paddingSpace
        let widthPerItem = availableWidth / CGFloat(Constants.numOfItems)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.sectionInsets
    }
}

extension ShareBottomViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemsInSection = getItemsPerSection(indexPath.section)
        let item = itemsInSection[indexPath.row]
        
        onSelectShareType?(item.type)
    }
}


