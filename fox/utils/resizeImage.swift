//
//  resizeImage.swift
//  fox
//
//  Created by Gracie on 10/04/2024.
//

import UIKit

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
    let size = image.size
    
    // Calculate aspect ratio of image
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Determine scale to fit target size
    let scaleFactor = min(widthRatio, heightRatio)
    
    // Calculate new size based on scale factor
    let scaledSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
    
    // Create a new image context
    UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0.0)
    
    // Draw the image into the new context
    image.draw(in: CGRect(origin: .zero, size: scaledSize))
    
    // Get the resized image from the context
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    
    // End the context
    UIGraphicsEndImageContext()
    
    return resizedImage
}

