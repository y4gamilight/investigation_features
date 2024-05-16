//
//  ShareBottomView.swift
//  Share
//
//  Created by Lê Thành on 12/05/2024.
//

import UIKit

class ShareBottomView: UIView {
    var onSelectShareType:((EShareType) -> ())?
    private enum Constants {
        static let height = 280.0
    }
    
    
    private lazy var optionsListView: UICollectionView = {
        let layout = CenterAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let clv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        clv.backgroundColor = .clear
        clv.isScrollEnabled = false
        clv.translatesAutoresizingMaskIntoConstraints = false
        return clv
    }()
    
    private lazy var dataSource: ShareBottomViewDataSource = {
       return ShareBottomViewDataSource()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        bindEvent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        bindEvent()
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
    
    private func bindEvent() {
        dataSource.onSelectShareType = {[weak self] type in
            self?.onSelectShareType?(type)
        }
    }
    
    func loadData() {
        let optionsList: [ShareBottomViewItemModel] = [.init(type: .messages),
                                                               .init(type: .instagram),
                                                               .init(type: .whatsApp),
                                                               .init(type: .saveImage),
                                                               .init(type: .more)]
        dataSource.update(items: optionsList)
        optionsListView.reloadData()
    }
}
