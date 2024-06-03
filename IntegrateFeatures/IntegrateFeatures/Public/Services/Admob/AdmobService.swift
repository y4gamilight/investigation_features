//
//  AdmobService.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 28/05/2024.
//

import UIKit
import GoogleMobileAds
import Combine

protocol IAdmobService {
    var ads: PassthroughSubject<[GADNativeAd], Error> { get }
    func loadNativeAd(in viewController: UIViewController)
}

class AdmobServiceImp: IAdmobService {
    private var nativeAd: Y4gAdmobNativeAd
    init() {
        let adUnitId = Bundle.main.object(forInfoDictionaryKey: "GADNativeAdUnit") as? String
        self.nativeAd = Y4gAdmobNativeAd(adUnitId: adUnitId ?? "")
    }
    
    func loadNativeAd(in viewController: UIViewController) {
        nativeAd.loadMultiAds(in: viewController, numberAds: 1)
    }

    var ads: PassthroughSubject<[GADNativeAd], Error> {
        return nativeAd.listAds
    }
}
