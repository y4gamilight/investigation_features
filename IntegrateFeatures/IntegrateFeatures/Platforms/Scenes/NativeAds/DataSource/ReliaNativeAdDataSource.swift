//
//  ReliaNativeAdDataSource.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 30/05/2024.
//

import UIKit

class ReliaNativeAdDataSource: NSObject {
    fileprivate var cellItems: [ReliaNativeCellItem] = []
    fileprivate var collectionItems: [ReliaNativeCollectionItem] = []
    
    override init() {
        super.init()
    }
    
    func updateCellItems(_ items: [ReliaNativeCellItem]) {
        self.cellItems = items
    }
    
    func updateCollectionItems(_ items: [ReliaNativeCollectionItem]) {
        self.collectionItems = items
    }
}

extension ReliaNativeAdDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReliaNativeCollectionCell.identifier, for: indexPath) as! ReliaNativeCollectionCell
        cell.model = self.collectionItems[indexPath.row]
        return cell
    }
}

extension ReliaNativeAdDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReliaNativeTableCell.identifier) as! ReliaNativeTableCell
        cell.model = self.cellItems[indexPath.row]
        return cell
    }
}
