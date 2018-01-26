//
//  UIImageExtension.swift
//  Chatster
//
//  Created by Shanbo on 1/13/18.
//  Copyright © 2018 chat. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    
    var isPortrait:  Bool    { return size.height > size.width }
    var isLandscape: Bool    { return size.width > size.height }
    var breadth:     CGFloat { return min(size.width, size.height) }
    var breadthSize: CGSize  { return CGSize(width: breadth, height: breadth) }
    var breadthRect: CGRect  { return CGRect(origin: .zero, size: breadthSize) }
    var circleMasked: UIImage? {
        UIGraphicsBeginImageContextWithOptions(breadthSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let cgImage = cgImage?.cropping(to: CGRect(origin: CGPoint(x: isLandscape ? floor((size.width - size.height) / 2) : 0, y: isPortrait  ? floor((size.height - size.width) / 2) : 0), size: breadthSize)) else { return nil }
        UIBezierPath(ovalIn: breadthRect).addClip()
        UIImage(cgImage: cgImage, scale: 1, orientation: imageOrientation).draw(in: breadthRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    func resizeImage(targetSize: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    func profileImage(frameImage: UIImage)->UIImage{
        let newImageWidth  = frameImage.size.width
        let newImageHeight = frameImage.size.height
        let newImageSize = frameImage.size
        
        var newWidth = self.size.width
        if newWidth > self.size.height{
            newWidth = self.size.height
        }
        var newProfileImage = self.cropToBounds(width: newWidth, height: newWidth)
        newProfileImage =  newProfileImage!.maskRoundedImage(radius: newWidth/2)
        
        UIGraphicsBeginImageContextWithOptions(newImageSize, false, UIScreen.main.scale)
        frameImage.draw(in: CGRect(x: 0, y: 0, width: newImageWidth, height: newImageHeight))
        newProfileImage?.draw(in: CGRect(
            x: round(newImageWidth * 0.13),
            y: round(newImageHeight * 0.06),
            width: round(newImageWidth * 0.75),
            height: round(newImageWidth * 0.75)))
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    func cropToBounds(width: CGFloat, height: CGFloat) -> UIImage? {
        let contextSize: CGSize = self.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = width
        var cgheight: CGFloat = height
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        let rect:CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        guard let imageRef = self.cgImage?.cropping(to: rect) else {
            return nil
        }
        let croppedImage = UIImage(cgImage:imageRef)
        return croppedImage
    }
    func maskRoundedImage(radius: CGFloat) -> UIImage {
        let imageView: UIImageView = UIImageView(image: self)
        var layer: CALayer = CALayer()
        layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = radius
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage!
    }
    
}


