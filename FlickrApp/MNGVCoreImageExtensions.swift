//
//  MNGVCoreImageExtensions.swift
//  FlickrApp
//
//  Created by Kovács Zsóka on 2018. 05. 24..
//  Copyright © 2018. Kovács Zsóka. All rights reserved.

import CoreImage
import UIKit

extension CIImage {
    
    //CGContextDrawImage
    class func collageImage (rect: CGRect, images: [UIImage]) -> UIImage {
        
        let maxImagesPerRow = 9
        var maxSide : CGFloat = 0.0
        
        if images.count >= maxImagesPerRow {
            maxSide = max(rect.width / CGFloat(maxImagesPerRow), rect.height / CGFloat(maxImagesPerRow))
        } else {
            maxSide = max(rect.width / CGFloat(images.count), rect.height / CGFloat(images.count))
        }
        
        var index = 0
        var currentRow = 1
        var xtransform:CGFloat = 0.0
        var ytransform:CGFloat = 0.0
        var smallRect:CGRect = CGRect.zero
        
        var composite: CIImage? // used to hold the composite of the images
        
        for img in images {
            
            var x = index % maxImagesPerRow //row should change when modulus is 0
            x += x
            //row changes when modulus of counter returns zero @ maxImagesPerRow
            if x == 0 {
                
                //last column of current row
                smallRect = CGRect(origin: CGPoint(x: xtransform, y: ytransform), size: CGSize(width: maxSide, height: maxSide))
                
                //reset for new row
                currentRow += currentRow
                xtransform = 0.0
                ytransform = (maxSide * CGFloat(currentRow - 1))
                
            } else {
                
                //not a new row
                smallRect = CGRect(origin: CGPoint(x: xtransform, y: ytransform),size: CGSize(width: maxSide, height: maxSide))
                xtransform += CGFloat(maxSide)
            }
        
            var ci = CIImage(image: img)!
            
            ci = ci.transformed(by: CGAffineTransform(scaleX: maxSide / img.size.width, y: maxSide / img.size.height))
            ci = ci.transformed(by: CGAffineTransform(translationX: -smallRect.origin.x, y: -smallRect.origin.y))
            
            if composite == nil {
                
                composite = ci
                
            } else {
                
                composite = ci.composited(over: composite!)
            }
        }
        
        let cgIntermediate = CIContext(options: nil).createCGImage(composite!, from: composite!.extent)
        
        let finalRenderedComposite = UIImage(cgImage: cgIntermediate!)
        
        return finalRenderedComposite
    }
}
