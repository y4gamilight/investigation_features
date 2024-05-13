//
//  Cell.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

class ShareBottomViewCell: UICollectionViewCell {
    private var _model: ShareBottomViewItemModel!
    var model: ShareBottomViewItemModel {
        get { _model }
        set {
            appIcon.image = newValue.image
            lblAppName.text = newValue.content
            _model = newValue
        }
    }
    
    private let appIconSize: CGSize = .init(width: 64, height: 64)
    private let appNameConstant: UIEdgeInsets = .init(top: 10, left: 0, bottom: 0, right: 0)
    
    private let appIconBorderColor: UIColor = .lightGray
    private let appIconBorderWidth = 1
    private let appIconCornerRadius: CGFloat = 5
    private lazy var appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = appIconBorderColor.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = appIconCornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var lblAppName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [appIcon, lblAppName].forEach(contentView.addSubview(_:))
        NSLayoutConstraint.activate([
            appIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            appIcon.heightAnchor.constraint(equalToConstant: appIconSize.height),
            appIcon.widthAnchor.constraint(equalToConstant: appIconSize.width),
            appIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            lblAppName.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: appNameConstant.top),
            lblAppName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lblAppName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lblAppName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
