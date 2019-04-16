//
//  Extension.swift
//  SwiftLearner
//
//  Created by vishal on 06/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIColor {
    static func getColor(_ index: inout Int) -> UIColor {
        let customColor = [#colorLiteral(red: 0.7343687136, green: 0.9295110244, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.6864915629, green: 0.5928410323, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.6516680465, blue: 0.7344312514, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.7163019496, blue: 0.6600852102, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.9252332564, blue: 0.7171542069, alpha: 1),#colorLiteral(red: 0.7680212324, green: 0.8862745166, blue: 0.7207610837, alpha: 1)]
        index = index % customColor.count
        return customColor[index]
    }
}

struct SegueId {
    static let segueTopicManager = "segueTopicManager"
    static let segueDashBoard = "segueDashBoard"
    static let segueSubTopicManager = "segueSubTopicManager"
}
