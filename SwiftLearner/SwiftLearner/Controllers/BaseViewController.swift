//
//  BaseViewController.swift
//  SwiftLearner
//
//  Created by vishal on 07/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
