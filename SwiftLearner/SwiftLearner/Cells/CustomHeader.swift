//
//  CustomHeader.swift
//  LliTest
//
//  Created by MTPL on 04/02/19.
//  Copyright © 2019 MTPL. All rights reserved.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet weak var btnCustomView: UIButton!
    @IBOutlet weak var imgBtnArraw: UIImageView!
    @IBOutlet weak var lblCustomView: UILabel!
    
    typealias reloadCustomData = () -> Void
    
    var reloadmyData : reloadCustomData!
    
    @IBAction func clickHeader(_ sender : UIButton) {
        self.reloadmyData!()
    }
}
