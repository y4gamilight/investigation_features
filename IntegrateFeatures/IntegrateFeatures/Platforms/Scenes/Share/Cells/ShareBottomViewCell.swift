//
//  Cell.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

class ShareBottomViewCell: UICollectionViewCell {
    private enum Constants {
        static let paddingItem = 16.0
        static let widthImage = 32.0
        static let widthImageContainer = 64.0
        static let paddingTopImage = 4.0
    }
    
    private var _model: ShareBottomViewItemModel!
    var model: ShareBottomViewItemModel {
        get { _model }
        set {
            appIcon.image = newValue.image
            lblAppName.text = newValue.content
            _model = newValue
        }
    }
    
    
    private let appIconBorderWidth = 1
    private let appIconCornerRadius: CGFloat = 5
    private lazy var appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imageContainer: UIView = {
        let view = UIView()
        view.layer.borderColor = AppColors.borderBottomSheetItem.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = appIconCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lblAppName: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = AppColors.defaultContent
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
        [imageContainer, lblAppName].forEach(contentView.addSubview(_:))
        imageContainer.addSubview(appIcon)
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainer.heightAnchor.constraint(equalToConstant: Constants.widthImageContainer),
            imageContainer.widthAnchor.constraint(equalToConstant: Constants.widthImageContainer),
            imageContainer.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            lblAppName.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: Constants.paddingTopImage),
            lblAppName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lblAppName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lblAppName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            appIcon.heightAnchor.constraint(equalToConstant: Constants.widthImage),
            appIcon.widthAnchor.constraint(equalToConstant: Constants.widthImage),
            appIcon.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            appIcon.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
        ])
    }
}
