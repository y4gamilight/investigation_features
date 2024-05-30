//
//  ReliaNativeTableCell.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 30/05/2024.
//

import UIKit

class ReliaNativeTableCell: UITableViewCell {
    
    static let nibName = "ReliaNativeTableCell"
    static let identifier = "ReliaNativeTableCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var _model: ReliaNativeCellItem!
    
    var model: ReliaNativeCellItem {
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
