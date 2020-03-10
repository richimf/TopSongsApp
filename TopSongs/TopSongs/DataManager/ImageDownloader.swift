//
//  ImageDownloader.swift
//  TheMovieApp
//
//  Created by Ricardo Montesinos on 08/03/20.
//  Copyright © 2020 RicardoMontesinos. All rights reserved.
//

import UIKit

class ImageDownloader {
  // MARK: - PRIVATE METHODS
  // DOWNLOAD AND COMPRESSING IMAGE METHOD
  func downloadAndCompress(url: URL, newSize: CGSize) -> UIImage? {
    guard let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
      let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil),
      let colorSpace = CGColorSpace(name: CGColorSpace.sRGB) else { return nil }
    let context = CGContext(data: nil,
                            width: Int(newSize.width),
                            height: Int(newSize.height),
                            bitsPerComponent: image.bitsPerComponent,
                            bytesPerRow: image.bytesPerRow,
                            space: image.colorSpace ?? colorSpace,
                            bitmapInfo: image.bitmapInfo.rawValue)
    context?.interpolationQuality = .high
    context?.draw(image, in: CGRect(origin: .zero, size: newSize))
    guard let scaledImage = context?.makeImage() else { return nil }
    return UIImage(cgImage: scaledImage)
  }
}
