//
//  Gradient.swift
//  SwiftLearner
//
//  Created by vishal on 06/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

@IBDesignable
class Gradient: UIView {
    @IBInspectable var startColor:   UIColor = #colorLiteral(red: 0.737254902, green: 0.2705882353, blue: 0.1450980392, alpha: 1) { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = #colorLiteral(red: 0.4352941176, green: 0.4470588235, blue: 0.6666666667, alpha: 1) { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.00 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.90 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  true { didSet { updatePoints() }}
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
