//
//  ReliaShareVC.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import Foundation
import UIKit

class ReliaShareVC: BaseViewController {
    private var viewModel: ReliaShareViewModel = ReliaShareViewModel()
    private lazy var navBar: NavBarView = {
        let view = NavBarView()
        view.prepareData(title: "Share", backIcon: "")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shareView: ShareView = {
        let view = ShareView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomView: ShareBottomView = {
        let view = ShareBottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = ShareItemModel(publisherName: "VNExpress", iconUrl: "https://sannhiphutho.com/wp-content/uploads/2022/08/vnexpress.png", title: "90% of condotel projects record no sale in Q1", content: "Ninety percent of condotel projects in Vietnam recorded no sales in the first quarter as demand plunged to a five-year low, according to market researcher DKRA Group.\nAlthough 4,800 new units were launched, only 64, or 1%, were sold, said a new report by the group.\nMost of the new units came from existing projects in central and southern Vietnam: Quang Nam, Binh Dinh, Khanh Hoa, Binh Thuan and Ba Ria-Vung Tau.")
        
        shareView.model = model
    }
    
    override func setup() {
        view.backgroundColor = .black
        [navBar, shareView, bottomView].forEach( view.addSubview(_:) )
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 64),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            shareView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            shareView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shareView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bottomView.topAnchor.constraint(equalTo: shareView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 280),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        bottomView.loadData()
    }
    
    override func bindEvent() {
        bottomView.onSelectShareType = {[weak self] type in
            guard let self = self else { return }
            let shareContent = self.shareView.getShareContent()
            self.viewModel.handleShare(to: type, with: shareContent)
        }
    }
    
    override func bindData() {
        viewModel.onBeginShareOnMessages = {[weak self] contentData, mimeType, fileName in
            guard let self = self else { return }
            self.navigator.presentMFMessageComposeScreen(parent: self,
                                                         contentData,
                                                         mimeType,
                                                         fileName,
                                                         self.viewModel)
        }
        
        viewModel.onPresentAppleShareSheet = {[weak self] activityItems in
            guard let self = self else { return }
            self.navigator.presentAppleShareSheet(parent: self,
                                                   activityItems: activityItems,
                                                   completionWithItemsHandler: nil)
        }
    }
    
}
