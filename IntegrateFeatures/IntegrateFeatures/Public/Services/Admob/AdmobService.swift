//
//  AdmobService.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 28/05/2024.
//

import UIKit
import GoogleMobileAds

protocol IAdmobService {
    func loadNativeAd(in viewController: UIViewController)
    //    func addObserver(_ observer: AdRewardVideoManageDelegate)
    //    func removeObserver(_ observer:AdRewardVideoManageDelegate)
}

class AdmobServiceImp: IAdmobService {
    
    private var nativeAd: Y4gAdmobNativeAd
    init() {
        self.nativeAd = Y4gAdmobNativeAd(adUnitId: "")
    }
    
    func loadNativeAd(in viewController: UIViewController) {
        nativeAd.loadAds(in: viewController)
    }
//
//    func addObserver(_ observer: AdRewardVideoManageDelegate) {
//        adsRewardVideo?.addObserver(observer)
//    }
//    
//    func removeObserver(_ observer:AdRewardVideoManageDelegate) {
//        adsRewardVideo?.removeObserver(observer)
//    }
}
