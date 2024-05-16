//
//  ReliaShareViewModel.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 15/05/2024.
//

import UIKit
import MessageUI

class ReliaShareViewModel: NSObject {
    var onBeginShareOnMessages: ((Data, String, String) -> ())?
    var onPresentAppleShareSheet: (([Any]) -> ())?
    
    private lazy var libraryPhotoHelper: LibraryPhotoService = {
        var helper = LibraryPhotoService()
        helper.delegate = self
        return helper
    }()
    
    func handleShare(to type: EShareType, with content: UIImage) {
        switch type {
        case .messages:
            handleShareContentOnMessages(content)
        case .instagram:
            break
        case .whatsApp:
            break
        case .saveImage:
            handleSaveImageToPhotoLibrary(content)
        case .more:
            onPresentAppleShareSheet?([content])
        }
    }
    
    private func handleSaveImageToPhotoLibrary(_ saveImage: UIImage) {
        libraryPhotoHelper.saveImageToPhotoLibrary(saveImage)
    }
    
    private func handleShareContentOnMessages(_ content: UIImage) {
        guard MFMessageComposeViewController.canSendAttachments() else { return }
        guard let contentData = content.pngData() else { return }
        let mimeType = "image/png"
        let imageName = "image.png"
        onBeginShareOnMessages?(contentData, mimeType, imageName)
    }
}

extension ReliaShareViewModel: LibraryPhotoDelegate {
    func didSaveImageFail() {
        
    }
    
    func didSaveImageSuccess() {
        
    }
}

extension ReliaShareViewModel: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
}
