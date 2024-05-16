//
//  LibraryPhotoService.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 15/05/2024.
//

import UIKit
 
protocol LibraryPhotoDelegate: AnyObject {
    func didSaveImageSuccess()
    func didSaveImageFail()
}
extension LibraryPhotoDelegate {
    func didSaveImageSuccess() { }
    func didSaveImageFail() { }
}

class LibraryPhotoService: NSObject {
    weak var delegate: LibraryPhotoDelegate?
    func saveImageToPhotoLibrary(_ image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(finishWriteImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func finishWriteImage(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let _ = error {
            delegate?.didSaveImageFail()
        } else {
            delegate?.didSaveImageSuccess()
        }
    }
}
