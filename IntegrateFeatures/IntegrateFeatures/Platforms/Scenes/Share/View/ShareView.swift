//
//  PinchView.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

class ShareView: UIView {
    private enum Constants {
        static let cornerRadius = 10.0
        static let paddingHeading = 20.0
    }
    
    private var _model: ShareItemModel!
    private var isScaling: Bool = false
    var model: ShareItemModel {
        get { return _model }
        set {
            titleLabel.text = newValue.title
            articleLabel.text = newValue.publisherName
            contentLabel.text = newValue.content
            if let url = URL(string: newValue.iconUrl) {
                imgHeaderView.downloadImage(from: url)
            }
            _model = newValue
        }
    }
    private var scaleLevel = EShareItemScaleLevel.medium
    
    private var contentViewLeadingConstraint: NSLayoutConstraint?
    private lazy var articleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = AppFonts.medium
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
        [articleLabel, imgHeaderView, line].forEach(view.addSubview(_:))
        NSLayoutConstraint.activate([
            articleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            articleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            imgHeaderView.heightAnchor.constraint(equalToConstant: 36),
            imgHeaderView.widthAnchor.constraint(equalToConstant: 36),
            imgHeaderView.leadingAnchor.constraint(equalTo: articleLabel.trailingAnchor, constant: 10),
            imgHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            line.topAnchor.constraint(equalTo: imgHeaderView.bottomAnchor, constant: 9),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            line.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        articleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = AppFonts.heading3
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var contentLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.font = AppFonts.regular
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, contentLabel])
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
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.paddingHeading),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.paddingHeading),
            
            contentStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Constants.cornerRadius
        view.dropShadow()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addGesture()
        updateView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        addGesture()
        updateView()
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        addSubview(contentView)
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
    
    private var startPoint: CGFloat? = nil
    private var endPoint: CGFloat? = nil
    @objc private func didPinch(_ gesture: UIPinchGestureRecognizer) {
      switch gesture.state {
      case .began:
        startPoint = gesture.scale
        break
      case .failed, .cancelled:
        startPoint = nil
        endPoint = nil
        break
      case .ended:
        endPoint = gesture.scale
        handleState()
        break
      default: break
      }
    }
  
  func handleState() {
    if isScaling { return }
    guard let startPoint = startPoint, let endPoint = endPoint else { return }
    isScaling = true
    if endPoint < startPoint && scaleLevel.isAllowZoomIn {
        scaleLevel = scaleLevel.previousLevel()
        updateView()
    } else if endPoint > startPoint && scaleLevel.isAllowZoomOut {
        scaleLevel = scaleLevel.nextLevel()
        updateView()
    }
  }
  
    func updateView() {
      titleLabel.isHidden = !scaleLevel.isShowTitle
      contentLabel.isHidden = !scaleLevel.isShowContent
      UIView.animate(withDuration: 0.4, animations: { [weak self] in
            guard let this = self else { return }
          
          if this.scaleLevel == .large {
            this.contentViewLeadingConstraint?.constant = 10
            } else {
            this.contentViewLeadingConstraint?.constant = 80
          }
          self?.layoutIfNeeded()
        }) { [weak self] _ in
          self?.isScaling = false
        }
        
    }
    
    func getShareContent() -> UIImage {
        contentView.snapshot()
    }
}
