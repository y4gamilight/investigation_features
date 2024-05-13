//
//  NavBarView.swift
//  Share
//
//  Created by  [Weak Self] on 11/05/2024.
//

import UIKit

class NavBarView: UIView {
    private let lblTitleContants: UIEdgeInsets = .init(top: 10, left: 10, bottom: -10, right: 0)
    private let btnBackContants: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -10)
    private let btnBackSize: CGSize = .init(width: 30, height: 30)
    
    private let titleFont: UIFont = UIFont.systemFont(ofSize: 30, weight: .bold)
    private let titleColor: UIColor = .white
    
    private lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = titleFont
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var btnBack: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(btnBackDidTouch), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc private func btnBackDidTouch() { }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        [lblTitle, btnBack].forEach(addSubview(_:))
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: topAnchor, constant: lblTitleContants.top),
            lblTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: lblTitleContants.left),
            lblTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: lblTitleContants.bottom),
            
            btnBack.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnBack.leadingAnchor.constraint(equalTo: lblTitle.trailingAnchor, constant: btnBackContants.left),
            btnBack.heightAnchor.constraint(equalToConstant: btnBackSize.height),
            btnBack.widthAnchor.constraint(equalTo: btnBack.heightAnchor),
            btnBack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: btnBackContants.right),
        ])
    }
    
    func prepareData(title: String, backIcon: String) {
        lblTitle.text = title
        btnBack.setImage(.init(named: backIcon), for: .normal)
    }
}
