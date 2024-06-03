//
//  Y4gAdmob.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 29/05/2024.
//
import UIKit
import GoogleMobileAds
import Combine

open class Y4gAdmobNativeAd: NSObject {
    open var adView: GADNativeAdView?
    open var nativeAds: GADNativeAd?
    open var nativeAdImage: GADNativeAdImage?
    private var adLoader: GADAdLoader?
    
    private var currentNativeAds = [GADNativeAd]()
    var listAds: PassthroughSubject<[GADNativeAd], Error> = PassthroughSubject<[GADNativeAd], Error>()
    private var adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    open func loadAds(in viewController: UIViewController) {
        loadMultiAds(in: viewController, numberAds: 1)
    }
    
    open func loadMultiAds(in viewController: UIViewController, numberAds: Int) {
        let multipleAdOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = numberAds;
        let adOption = GADNativeAdViewAdOptions()
        adOption.preferredAdChoicesPosition = .topLeftCorner
        adLoader = GADAdLoader(adUnitID: adUnitId,
                               rootViewController: viewController,
                               adTypes: [ .native ],
                               options: [ multipleAdOptions, adOption])
        adLoader?.delegate = self
        adLoader?.load(GADRequest())
    }
   
}

extension Y4gAdmobNativeAd: GADNativeAdLoaderDelegate {
    public func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        debugPrint("adLoader didReceived")
        currentNativeAds.append(nativeAd)
        listAds.send(currentNativeAds)
    }
    
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        debugPrint("adLoader error \(error)")
    }
    
    public func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        debugPrint("adLoader finished")
    }
}
