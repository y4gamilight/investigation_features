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
}
