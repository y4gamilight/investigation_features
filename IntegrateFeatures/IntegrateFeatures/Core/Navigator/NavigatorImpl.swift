//
//  NavigatorImpl.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 15/05/2024.
//

import UIKit
import MessageUI

class NavigatorImpl: Navigator {
    var navController: UINavigationController
    init(navController: UINavigationController) {
        self.navController = navController
    }
    func presentReliaShareScreen() {
        let vc = Storyboard.main.instantiateViewController(withIdentifier: "ReliaShareVC") as! ReliaShareVC
        vc.navigator = NavigatorImpl(navController: navController)
        navController.present(vc, animated: true)
    }
    
    func presentMFMessageComposeScreen(parent: UIViewController,
                                       _ contentData: Data,
                                       _ typeIdentifier: String,
                                       _ fileName: String,
                                       _ callBack: MFMessageComposeViewControllerDelegate?) {
        let vc = MFMessageComposeViewController()
        vc.messageComposeDelegate = callBack
        vc.addAttachmentData(contentData, typeIdentifier: typeIdentifier, filename: fileName)
        parent.present(vc, animated: true)
    }
    
    func presentAppleShareSheet(parent: UIViewController,
                                activityItems: [Any],
                                completionWithItemsHandler: UIActivityViewController.CompletionWithItemsHandler?) {
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        vc.completionWithItemsHandler = completionWithItemsHandler
        parent.present(vc, animated: true)
    }
    
    func presentReliaNativeAdScreen() {
        let vc = Storyboard.main.instantiateViewController(withIdentifier: "ReliaNativeAdsVC") as! ReliaNativeAdsVC
        vc.navigator = NavigatorImpl(navController: navController)
        navController.present(vc, animated: true)
    }
}
