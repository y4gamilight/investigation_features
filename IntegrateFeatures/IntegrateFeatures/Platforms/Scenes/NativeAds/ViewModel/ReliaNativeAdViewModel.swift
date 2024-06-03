//
//  ReliaNativeAdViewModel.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 30/05/2024.
//

import Foundation
import UIKit
import Combine

class ReliaNativeAdViewModel: NSObject{
    var onLoadTableCell: (([ReliaNativeCellItem]) -> Void)?
    var onLoadCollectionCell: (([ReliaNativeCollectionItem]) -> Void)?
    var adsService: IAdmobService
    private var cancelables = Set<AnyCancellable>()
    private var items: [ReliaNativeCellItem] = []
    private var collectionItems: [ReliaNativeCollectionItem] = []
    
    init(adsService: IAdmobService) {
        self.adsService = adsService
        super.init()
        self.registerEvents()
    }
    
    func loadAds(_ viewController: UIViewController) {
        self.adsService.loadNativeAd(in: viewController)
    }
    
    func loadData() {
        loadCellItems()
        loadCollectionItems()
    }
    
    private func loadCellItems() {
        var items: [ReliaNativeCellItem] = []
        
        for i in 1...30 {
            let title = "Title \(i)"
            let subTitle = "Subtitle \(i)"
            let item = ReliaNativeCellItem(title: title, subTitle: subTitle, isAds: false, ads: nil)
            items.append(item)
        }
        self.items = items
    }
    
    private func loadCollectionItems() {
        
        var items: [ReliaNativeCollectionItem] = []
        
        for i in 1...30 {
            let title = "Title Collection \(i)"
            let subTitle = "Subtitle Collection \(i)"
            let item = ReliaNativeCollectionItem(title: title, subTitle: subTitle, isAds: false, ads: nil)
            items.append(item)
        }
        self.collectionItems = items
    }
    
    func registerEvents() {
        adsService.ads
            .sink { complete in
                switch complete {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: {[weak self] ads in
                guard let this = self else { return }
                if ads.count == 0 { return }
                let delta = 6
                var index = 5
                var iAd = 0
                while index < this.items.count {
                    let ad = ads[iAd]
                    let value = ReliaNativeCellItem(title: ad.headline ?? "", subTitle: ad.body ?? "", isAds: true, ads: ad)
                    this.items.insert(value, at: index)
                    index += delta
                    iAd = iAd < ads.count - 1 ? iAd + 1 : 0
                }
                index = 5
                while index < this.items.count {
                    let ad = ads[iAd]
                    let value = ReliaNativeCollectionItem(title: ad.headline ?? "", subTitle: ad.body ?? "", isAds: true, ads: ad)
                    this.collectionItems.insert(value, at: index)
                    index += delta
                    iAd = iAd < ads.count - 1 ? iAd + 1 : 0
                }
                this.onLoadTableCell?(this.items)
                this.onLoadCollectionCell?(this.collectionItems)
            }
            .store(in: &cancelables)
    }
    
    
}
