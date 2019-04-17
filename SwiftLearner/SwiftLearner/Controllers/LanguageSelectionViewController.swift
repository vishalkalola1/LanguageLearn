//
//  LanguageSelectionViewController.swift
//  SwiftLearner
//
//  Created by Moweb on 15/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit





class LanguageSelectionViewController: UIViewController {

    @IBOutlet var languageViewHeightConstaints: NSLayoutConstraint!
    @IBOutlet var viewWidthConstraints: NSLayoutConstraint!
    
    @IBOutlet var componentsView: UIView!
    @IBOutlet var languageView: UIView!
    @IBOutlet var btnMacOS: UIButton!
    @IBOutlet var btnIOS: UIButton!
    @IBOutlet var btnWatchOS: UIButton!
    @IBOutlet var btnTvOS: UIButton!
    @IBOutlet var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1.0, animations: {
            self.languageViewHeightConstaints.constant = 320
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func btnObjCAction(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.viewWidthConstraints.constant = 300
            self.languageViewHeightConstaints.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func btnComponentsAction(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            self.viewWidthConstraints.constant = 1000
            //self.languageViewHeightConstaints.constant = 320
            self.view.layoutIfNeeded()
        }) { (completed) in
            self.viewWidthConstraints.constant = 0
            self.performSegue(withIdentifier: SegueId.segueDashBoard, sender: self)
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: {
            self.viewWidthConstraints.constant = 0
            self.languageViewHeightConstaints.constant = 320
            self.view.layoutIfNeeded()
        })
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        if touch.view === componentsView {
            let position = touch.location(in: self.view)
            let target = componentsView.center
            let angle = atan2(target.y-position.y, target.x-position.x)
            UIView.animate(withDuration: 1, delay: 0.5,usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                self.componentsView.transform = CGAffineTransform(rotationAngle: angle)
                self.btnMacOS.transform = CGAffineTransform(rotationAngle: -angle)
                self.btnIOS.transform = CGAffineTransform(rotationAngle: -angle)
                self.btnTvOS.transform = CGAffineTransform(rotationAngle: -angle)
                self.btnWatchOS.transform = CGAffineTransform(rotationAngle: -angle)
                self.btnBack.transform = CGAffineTransform(rotationAngle: -angle)
            }, completion: nil)
        }
    }
}
