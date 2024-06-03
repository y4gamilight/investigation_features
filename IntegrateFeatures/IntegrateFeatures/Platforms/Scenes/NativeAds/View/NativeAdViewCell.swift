//
//  NativeAdViewCell.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 03/06/2024.
//

import UIKit
import GoogleMobileAds

class NativeAdViewCell: UITableViewCell {
    static let nibName = "NativeAdViewCell"
    static let identifier = "NativeAdViewCell"
    
    private var _model: ReliaNativeCellItem!
    
    var model: ReliaNativeCellItem {
        get { return _model }
        set {
            _model = newValue
            (nativeAdView.bodyView as? UILabel)?.text = newValue.ads?.body
            (nativeAdView.advertiserView as? UILabel)?.text = newValue.ads?.advertiser
            (nativeAdView.iconView as? UIImageView)?.image = newValue.ads?.images?.first?.image
            nativeAdView.nativeAd = newValue.ads
        }
    }
    @IBOutlet weak var adChoiceView: GADAdChoicesView!
    @IBOutlet weak var imageAdView: UIImageView!
    @IBOutlet weak var nativeAdView: GADNativeAdView!
    @IBOutlet weak var adsView: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nativeAdView.adChoicesView = adChoiceView
        nativeAdView.advertiserView = adsView
        nativeAdView.bodyView = bodyLabel
        nativeAdView.iconView = imageAdView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
