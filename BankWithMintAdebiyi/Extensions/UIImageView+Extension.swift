//
//  UIImageView+Extension.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 13/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageAsync(from url: URL?) {
        let imageCache = NSCache<NSString, UIImage>()
        if let cachedImage = imageCache.object(forKey: url!.absoluteString as NSString) {
            self.image = cachedImage
        }else {
            URLSession.shared.dataTask(with: url!){ data,_,_ in
            if let data = data {
                let tempImage = UIImage(data: data)
                guard let downloadedImage = tempImage else { return }
                imageCache.setObject(downloadedImage, forKey: url!.absoluteString as NSString)
                DispatchQueue.main.async {
                    self.image = downloadedImage
                        }
                    }
            }.resume()
        }
    }
}
