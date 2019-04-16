//
//  ViewController.swift
//  SwiftLearner
//
//  Created by vishal on 06/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class DashBoardViewController: BaseViewController {

    @IBOutlet var collectionVIew: UICollectionView!
    var homeDataArray : [HomePage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let objHomeArray = VDatabaseManager.shared.executeQuery("select * from MainTopicMaster", model: [HomePage].self) {
            homeDataArray = objHomeArray
        }
    }
}


extension DashBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeDataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeItem = homeDataArray?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String.init(describing: HomeViewCell.self), for: indexPath) as! HomeViewCell
        cell.imgIconHome.image = UIImage(named: homeItem?.Image ?? "")
        cell.lblNameHome.text = homeItem?.Name ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing = ((collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing)
        let interLinerSpacing = ((collectionViewLayout as!UICollectionViewFlowLayout).minimumLineSpacing)
        return CGSize.init(width: (collectionView.frame.width / (UIDevice.current.userInterfaceIdiom == .pad ? 3 : 2)) - interItemSpacing, height: (collectionView.frame.width / (UIDevice.current.userInterfaceIdiom == .pad ? 3 : 2)) - interLinerSpacing)
    }
    
    //click event of any cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            let objHomeDataArray = homeDataArray?[indexPath.row]
            self.performSegue(withIdentifier: SegueId.segueTopicManager, sender: objHomeDataArray)
        }else{
//            let favoriteVC1 =  self.storyboard?.instantiateViewController(withIdentifier: "favoriteVC") as! favoriteVC
//            //favoriteVC1.homeArray = homeItems;
//            self.navigationController?.pushViewController(favoriteVC1, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let objDestination = segue.destination as? TopicManagerViewController {
            let objHomePage = sender as? HomePage
            objDestination.MainTopic = objHomePage
        }
    }
}
