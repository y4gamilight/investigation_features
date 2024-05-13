//
//  Type.swift
//  Share
//
//  Created by Lê Thành on 13/05/2024.
//

import UIKit

enum EShareType: String {
    case messages
    case instagram
    case whatsApp
    case saveImage
    case more
    
    var content: String {
        switch self {
        case .messages:
            "Messages"
        case .instagram:
            "Instagram"
        case .whatsApp:
            "WhatsApp"
        case .saveImage:
            "Save Image"
        case .more:
            "More"
        }
    }
    
    var image: UIImage {
        switch self {
        case .messages:
            return UIImage(named: "ic_message")!
        case .instagram:
            return UIImage(named: "ic_instagram")!
        case .whatsApp:
            return UIImage(named:"ic_whatsapp")!
        case .saveImage:
            return UIImage(named:"ic_technology")!
        case .more:
            return UIImage(named:"ic_share")!
        }
    }
}
