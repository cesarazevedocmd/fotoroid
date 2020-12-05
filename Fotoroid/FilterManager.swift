//
//  FilterManager.swift
//  Fotoroid
//
//  Created by César Alves de Azevedo on 05/12/20.
//

import Foundation
import UIKit

enum FilterType: Int {
    case comic
    case sepia
    case halftone
    case crystallize
    case vingnette
    case noir
}

class FilterManager {
    
    let originalImage: UIImage!
    let context = CIContext(options: nil)
    let filterName = [
        "CIComicEffect",
        "CISepiaTone",
        "CICMYHalftone",
        "CICrystallize",
        "CIVignette",
        "CIPhotoEffectNoir"]
    
    init(image: UIImage) {
        originalImage = image
    }
    
    func applyFilter(type: FilterType) -> UIImage {
        let ciImage = CIImage(image: originalImage)!
        let filter = CIFilter(name: filterName[type.hashValue])!
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        switch type {
            case .comic:
                break
            case .sepia:
                filter.setValue(1.0, forKey: kCIInputIntensityKey)
            case .halftone:
                filter.setValue(25, forKey: kCIInputWidthKey)
            case .crystallize:
                filter.setValue(25, forKey: kCIInputRadiusKey)
            case .vingnette:
                filter.setValue(3, forKey: kCIInputIntensityKey)
                filter.setValue(30, forKey: kCIInputRadiusKey)
            case .noir:
                break
        }
        
        let filteredImage = filter.value(forKey: kCIOutputImageKey) as! CIImage
        let cgImage = context.createCGImage(filteredImage, from: filteredImage.extent)!
        return UIImage(cgImage: cgImage)
    }
}