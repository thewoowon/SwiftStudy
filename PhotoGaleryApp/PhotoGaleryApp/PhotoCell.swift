//
//  PhotoCell.swift
//  PhotoGaleryApp
//
//  Created by woowon on 2022/02/07.
//

import Foundation
import UIKit
import PhotosUI

class PhotoCell: UICollectionViewCell{
    
    func loadImage(asset : PHAsset){
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options){
            image, info in
            
            if (info?[PHImageResultIsDegradedKey] as? Bool) == true{
                self.photoImageView.image = image
            }
            else{
                
            }
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!{
        didSet{
            photoImageView.contentMode = .scaleAspectFill
        }
    }
}
