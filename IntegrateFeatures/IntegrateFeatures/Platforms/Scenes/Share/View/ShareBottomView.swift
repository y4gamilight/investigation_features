//
//  ShareBottomView.swift
//  Share
//
//  Created by  [Weak Self] on 12/05/2024.
//

import UIKit

class ShareBottomView: UIView {
    
    private enum Constants {
        static let height = 280.0
    }
    
    
    private lazy var optionsListView: UICollectionView = {
        let layout = CenterAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let clv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clv.backgroundColor = .clear
        clv.translatesAutoresizingMaskIntoConstraints = false
        return clv
    }()
    
    private lazy var dataSource: ShareBottomViewDataSource = {
       return ShareBottomViewDataSource()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = AppColors.backgroundBottomSheet
        addSubview(optionsListView)
        NSLayoutConstraint.activate([
            optionsListView.topAnchor.constraint(equalTo: topAnchor),
            optionsListView.heightAnchor.constraint(equalToConstant: Constants.height),
            optionsListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionsListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionsListView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        
        optionsListView.delegate = self.dataSource
        optionsListView.dataSource = self.dataSource
        optionsListView.register(ShareBottomViewCell.self, forCellWithReuseIdentifier: "ShareBottomViewCell")
    }
    
    func loadData() {
        var optionsList: [ShareBottomViewItemModel] = [.init(type: .messages),
                                                               .init(type: .instagram),
                                                               .init(type: .whatsApp),
                                                               .init(type: .saveImage),
                                                               .init(type: .more)]
        dataSource.update(items: optionsList)
        optionsListView.reloadData()
    }
}