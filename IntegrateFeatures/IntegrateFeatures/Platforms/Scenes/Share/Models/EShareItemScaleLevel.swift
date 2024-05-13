//
//  EShareItemScaleLevel.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 13/05/2024.
//

import Foundation

enum EShareItemScaleLevel {
    case small
    case medium
    case large
    
    var value: Float {
        switch self {
        case .small:
            return 1.0
        case .medium:
            return 2.0
        case .large:
            return 3.0
        }
    }
    
    var isShowTitle: Bool {
        return self != .medium
    }
    
    var isShowContent: Bool {
        return self != .small
    }
    
    var isAllowZoomOut: Bool {
        return self != .large
    }
    
    var isAllowZoomIn: Bool{
        return self != .small
    }
    
    func nextLevel() -> EShareItemScaleLevel {
        switch self {
        case .small:
            return .medium
        case .medium:
            return .large
        default:
            return .large
        }
    }
    
    func previousLevel() -> EShareItemScaleLevel {
        switch self {
        case .large:
            return .medium
        case .medium:
            return .small
        default:
            return .small
        }
    }
}

