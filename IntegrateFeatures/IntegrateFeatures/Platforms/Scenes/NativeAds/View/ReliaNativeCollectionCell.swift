//
//  ReliaNativeCollectionCell.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 30/05/2024.
//

import UIKit

class ReliaNativeCollectionCell: UICollectionViewCell {
    
    static let nibName = "ReliaNativeCollectionCell"
    static let identifier = "ReliaNativeCollectionCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    private var _model: ReliaNativeCollectionItem!
    
    var model: ReliaNativeCollectionItem {
        get { return _model }
        set {
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
