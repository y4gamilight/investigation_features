//
//  ReliaNativeAdsTableCell.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 01/06/2024.
//

import UIKit

class ReliaNativeAdsTableCell: UITableViewCell {
    static let nibName = "ReliaNativeAdsTableCell"
    static let identifier = "ReliaNativeAdsTableCell"

    @IBOutlet weak var adsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var _model: ReliaNativeCellItem!
    var model: ReliaNativeCellItem {
        get {
            return _model
        }
        set {
            adsImageView.image = newValue.ads?.images?.first?.image ?? UIImage()
            titleLabel.text = newValue.title
            subtitleLabel.text = newValue.subTitle
            _model = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
