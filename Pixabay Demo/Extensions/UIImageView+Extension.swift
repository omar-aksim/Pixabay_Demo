//
//  UIImageView+Extension.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/24/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL?, placeholder: UIImage) {
        DispatchQueue.main.async {
            self.image = placeholder
        }
        
        guard let remoteURL = url else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: remoteURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
