//
//  WhatAppShareService.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 17/05/2024.
//

import UIKit

protocol WhatAppShareService {
    func shareLink(_ text: String)
}

class WhatAppShareServiceImp: WhatAppShareService {
    
    private enum Params {
        static let schemeUrl = "whatsapp"
        static let path = "send"
    }
    
    func shareLink(_ text: String) {
        if var url = URL(string: "\(Params.schemeUrl)://\(Params.path)") {
            if #available(iOS 16.0, *) {
                url.append(queryItems: [URLQueryItem(name: "text", value: text)])
            } else {
                // Fallback on earlier versions
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
