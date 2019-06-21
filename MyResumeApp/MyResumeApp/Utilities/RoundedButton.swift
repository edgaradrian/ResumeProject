//
//  RoundedButton.swift
//  MyResumeApp
//
//  Created by Edgar Adrián on 6/20/19.
//  Copyright © 2019 Edgar Adrián. All rights reserved.
//

import UIKit

@IBDesignable open class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 18 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }//cornerRadius

    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }//borderWidth

    @IBInspectable var borderColor: UIColor = UIColor.init(red: 195, green: 214, blue: 0, alpha: 1.0){
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }//borderColor
    
}//class RoundedButton
