//
//  PrettyImage.swift
//  UIKitFirstApp
//
//  Created by Carlos Xavier Carvajal Villegas on 8/3/25.
//

import UIKit

final class PrettyImage: UIImageView {
    
    override func awakeFromNib() {
        Task { @MainActor in
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowOpacity = 0.2
            layer.cornerRadius = 10
        }
        
    }

}
