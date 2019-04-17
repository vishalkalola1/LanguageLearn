//
//  SubTopicManagerViewController.swift
//  SwiftLearner
//
//  Created by vishal on 17/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class SubTopicManagerViewController: BaseViewController {

    @IBOutlet var webVIew: UIWebView!
    
    var titleText : String?
    var dataManagerModel : DataManagerModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTitle.text = titleText
        
        //let url = Bundle.main.url(forResource: "File", withExtension: "html")
        
        //let request = URLRequest(url: URL(fileURLWithPath: url!.path))
        
        //webVIew.loadRequest(request)
        webVIew.loadHTMLString(dataManagerModel?.SubTopicData ?? "", baseURL: nil)
    }

}
