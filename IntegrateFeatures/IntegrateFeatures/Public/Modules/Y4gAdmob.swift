//
//  Y4gAdmob.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 29/05/2024.
//
import UIKit
import GoogleMobileAds

open class Y4gAdmobNativeAd: NSObject {
    open var adView: GADNativeAdView?
    open var nativeAds: GADNativeAd?
    open var nativeAdImage: GADNativeAdImage?
    private var adLoader: GADAdLoader?
    private var adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    open func loadAds(in viewController: UIViewController) {
        adLoader = GADAdLoader(adUnitID: adUnitId, rootViewController: viewController, adTypes: [ .native ], options: [])
        adLoader?.delegate = self
    }
    
    open func loadMultiAds(in viewController: UIViewController, numberAds: Int) {
        let multipleAdOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = numberAds;
        adLoader = GADAdLoader(adUnitID: adUnitId,
                               rootViewController: viewController,
                               adTypes: [ .native ],
                               options: [ multipleAdOptions ])
    }
    
    private func loadAds() {
        adLoader?.load(GADRequest())
    }
   
}

extension Y4gAdmobNativeAd: GADNativeAdLoaderDelegate {
    public func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        
    }
    
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        
    }
    
    public func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        
    }
}
