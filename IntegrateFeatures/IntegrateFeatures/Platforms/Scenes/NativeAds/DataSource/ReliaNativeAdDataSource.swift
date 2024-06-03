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
        let model = self.collectionItems[indexPath.row]
        if model.isAds {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReliaNativeAdsCollectionCell.identifier, for: indexPath) as! ReliaNativeAdsCollectionCell
            cell.model = model
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReliaNativeCollectionCell.identifier, for: indexPath) as! ReliaNativeCollectionCell
            cell.model = model
            return cell
        }
    }
}

extension ReliaNativeAdDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.cellItems[indexPath.row]
        if model.isAds {
            if indexPath.row % 5 == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: NativeAdViewCell.identifier) as! NativeAdViewCell
                cell.model = model
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: ReliaNativeAdsTableCell.identifier) as! ReliaNativeAdsTableCell
                cell.model = model
                return cell
                
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReliaNativeTableCell.identifier) as! ReliaNativeTableCell
            cell.model = model
            return cell
        }
    }
}
