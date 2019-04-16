//
//  HomeViewCell.swift
//  SwiftLearner
//
//  Created by vishal on 06/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIconHome: UIImageView!
    @IBOutlet weak var lblNameHome: UILabel!
    @IBOutlet weak var viewHome: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
