//
//  Navigator.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 15/05/2024.
//

import Foundation
import MessageUI

protocol Navigator {
    func presentReliaShareScreen()
    
    func presentMFMessageComposeScreen(parent: UIViewController,
                                       _ contentData: Data,
                                       _ typeIdentifier: String,
                                       _ fileName: String,
                                       _ callBack: MFMessageComposeViewControllerDelegate?)
    
    func presentAppleShareSheet(parent: UIViewController,
                                activityItems: [Any],
                                completionWithItemsHandler: UIActivityViewController.CompletionWithItemsHandler?)
}
