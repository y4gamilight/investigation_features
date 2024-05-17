//
//  InstagramShareService.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 16/05/2024.
//

import UIKit

enum InstagramShareParamKey: String {
    case backgroundImage = "com.instagram.sharedSticker.backgroundImage"
    case contentURL = "com.instagram.sharedSticker.contentURL"
}

protocol InstagramShareService {
    func shareToStory(_ info: [InstagramShareParamKey: Any])
}

class InstagramShareServiceImp: InstagramShareService {
    
    private enum Constants {
        static let schemeUrl = "instagram-stories"
        static let path = "share"
    }
    
    func shareToStory(_ info: [InstagramShareParamKey: Any]){
        
        let pasteboardItems = info.reduce([String: Any]()) { (result, item) in
            var result = result
            result[item.key.rawValue] = item.value
            return result
        }
        
        let pasteboardOptions = [
            UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
        ]
        
        UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
        
        if let url = URL(string: "\(Constants.schemeUrl)://\(Constants.path)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
