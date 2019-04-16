//
//  CustomViewClass.swift
//  SwiftLearner
//
//  Created by vishal on 07/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class CustomViewClass: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBInspectable var shadowRadius : CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset : CGSize = CGSize.init(width: 0, height: 0){
        didSet {
            self.layer.shadowOffset = self.shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity : Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor : UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
}
