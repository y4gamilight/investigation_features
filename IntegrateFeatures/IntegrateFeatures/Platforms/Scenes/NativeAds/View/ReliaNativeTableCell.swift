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
    @IBOutlet weak var containerView: UIView!
    
    private var _model: ReliaNativeCellItem!
    
    var model: ReliaNativeCellItem {
        get { return _model }
        set {
            _model = newValue
            titleLabel.text = _model.title
            subtitleLabel.text = _model.subTitle
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 16
        containerView.layer.backgroundColor = UIColor(hex: "e4e7e9").cgColor
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
