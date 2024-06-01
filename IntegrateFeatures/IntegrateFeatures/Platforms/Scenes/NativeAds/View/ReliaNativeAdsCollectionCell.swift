//
//  ReliaNativeAdsCollectionCell.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 01/06/2024.
//

import UIKit

class ReliaNativeAdsCollectionCell: UICollectionViewCell {
    static let nibName = "ReliaNativeAdsCollectionCell"
    static let identifier = "ReliaNativeAdsCollectionCell"
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var _model: ReliaNativeCollectionItem!
    var model: ReliaNativeCollectionItem {
        get {
            return _model
        }
        set {
            adImageView.image = newValue.ads?.images?.first?.image ?? UIImage()
            titleLabel.text = newValue.title
            subtitleLabel.text = newValue.subTitle
            _model = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
