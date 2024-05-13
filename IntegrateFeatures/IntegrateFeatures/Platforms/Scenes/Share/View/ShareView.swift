//
//  PinchView.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

class ShareView: UIView {
    enum EZoomScale: CGFloat {
        case x1 = 1.0
        case x2 = 2.0
        case x3 = 3.0
        
        func showTitle() -> Bool {
            switch self {
            case .x1:
                true
            case .x2:
                false
            case .x3:
                true
            }
        }
        
        func showContent() -> Bool {
            switch self {
            case .x1:
                false
            case .x2:
                true
            case .x3:
                true
            }
        }
    }
    var currentScale: CGFloat = 1.0
    let minScale: CGFloat = 1.0
    let maxScale: CGFloat = 3.0
    
    private var contentViewLeadingConstraint: NSLayoutConstraint?
    private lazy var lblHeaderTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "decipher"
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var imgHeaderView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        [lblHeaderTitle, imgHeaderView, line].forEach(view.addSubview(_:))
        NSLayoutConstraint.activate([
            lblHeaderTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lblHeaderTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            imgHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            imgHeaderView.heightAnchor.constraint(equalToConstant: 36),
            imgHeaderView.leadingAnchor.constraint(equalTo: lblHeaderTitle.trailingAnchor, constant: 10),
            imgHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            line.topAnchor.constraint(equalTo: imgHeaderView.bottomAnchor, constant: 9),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Nvidia's Al Lead Drives Growth"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var lblContent: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Market cap hits $2 trillion, making it the 3rd US company to do so. Revenue up 126% year-over-year to $60.9 billion. New H200 GPU coming in Q2 2024."
        lbl.numberOfLines = 0
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lblTitle, lblContent])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        [headerView, contentStackView].forEach(view.addSubview(_:))
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            contentStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        addGesture()
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        addSubview(contentView)
        contentView.frame = .init(x: 0, y: 0, width: 200, height: 136)
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        contentViewLeadingConstraint = contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80)
        contentViewLeadingConstraint?.isActive = true
    }
    
    private func addGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
        addGestureRecognizer(pinchGesture)
    }
    
    @objc private func didPinch(_ gesture: UIPinchGestureRecognizer) {
        guard gesture.state == .changed else { return }
        let pinchScale = gesture.scale
        var newScale = currentScale * pinchScale
        
        newScale = min(max(newScale.rounded(), minScale), maxScale)
        let zoomScaleState = EZoomScale(rawValue: newScale)
        lblTitle.isHidden = !(zoomScaleState?.showTitle() ?? false)
        lblContent.isHidden = !(zoomScaleState?.showContent() ?? false)
        
        switch zoomScaleState {
        case .x1, .x2:
            contentViewLeadingConstraint?.constant = 80
        case .x3:
            contentViewLeadingConstraint?.constant = 10
        case .none: break
        }
    }
}
