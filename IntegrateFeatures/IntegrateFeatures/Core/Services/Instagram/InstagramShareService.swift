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
    private enum Params {
        static let schemeUrl = "instagram-stories"
        static let path = "share"
        static let querySource = "source_application"
    }
    private enum Constants {
        static let facebookAppID = "<YOUR_APP_ID>"
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
        let urlString = "\(Params.schemeUrl)://\(Params.path)?\(Params.querySource)=\(Constants.facebookAppID)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
