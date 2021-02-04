//
//  Extensions.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 03.02.2021.
//

import Foundation
import UIKit

extension UIImageView {
   
    func load(urlString : String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

