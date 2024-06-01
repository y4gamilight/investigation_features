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
        adLoader = GADAdLoader(adUnitID: adUnitId, rootViewController: viewController, adTypes: [ .native ], options: [])
        adLoader?.delegate = self
        adLoader?.load(GADRequest())
    }
    
    open func loadMultiAds(in viewController: UIViewController, numberAds: Int) {
        let multipleAdOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = numberAds;
        adLoader = GADAdLoader(adUnitID: adUnitId,
                               rootViewController: viewController,
                               adTypes: [ .native ],
                               options: [ multipleAdOptions ])
        adLoader?.delegate = self
        adLoader?.load(GADRequest())
    }
   
}

//@property(nonatomic, readonly, copy, nullable) NSString *callToAction;
///// Icon image.
//@property(nonatomic, readonly, strong, nullable) GADNativeAdImage *icon;
///// Description.
//@property(nonatomic, readonly, copy, nullable) NSString *body;
///// Array of GADNativeAdImage objects.
//@property(nonatomic, readonly, strong, nullable) NSArray<GADNativeAdImage *> *images;
///// App store rating (0 to 5).
//@property(nonatomic, readonly, copy, nullable) NSDecimalNumber *starRating;
///// The app store name. For example, "App Store".
//@property(nonatomic, readonly, copy, nullable) NSString *store;
///// String representation of the app's price.
//@property(nonatomic, readonly, copy, nullable) NSString *price;
///// Identifies the advertiser. For example, the advertiser’s name or visible URL.
//@property(nonatomic, readonly, copy, nullable) NSString *advertiser;
///// Media content. Set the associated media view's mediaContent property to this object to display
///// this content.
//@property(nonatomic, readonly, nonnull) GADMediaContent *mediaContent;
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
