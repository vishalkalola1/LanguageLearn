//
//  TopicManagerViewController.swift
//  SwiftLearner
//
//  Created by vishal on 06/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class TopicManagerViewController: BaseViewController {

    @IBOutlet var topicTable: UITableView!
    
    var MainTopic : HomePage?
    var subTopicManagerModelArray = [TopicManagerWithDataManagerModel]()
    var selectedIndex = [Int]()
    var titleNextView : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() -> Void {
        self.lblTitle.text = MainTopic?.Name
        let headerNib = UINib.init(nibName: String.init(describing: CustomHeader.self), bundle: Bundle.main)
        topicTable.register(headerNib, forHeaderFooterViewReuseIdentifier: String.init(describing: CustomHeader.self))
        if let tempTopicModelArray = VDatabaseManager.shared.executeQuery("select * from TopicManager where MainTopicId = \(MainTopic?.Id ?? "0")", model: [TopicManagerModel].self) {
            for objHeader in tempTopicModelArray {
                let objDict = TopicManagerWithDataManagerModel()
                objDict.objTopic = objHeader
                objDict.objSubTopic =  getSubTopic(objHeader.TopicId ?? "0")
                subTopicManagerModelArray.append(objDict)
            }
        }
    }
    
    func getSubTopic(_ topicId:String) -> [DataManagerModel]? {
        if let topicModelArray = VDatabaseManager.shared.executeQuery("select * from DataManager where TopicID = \(topicId)", model: [DataManagerModel].self) {
            return topicModelArray
        }
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let objSegue = segue.destination as? SubTopicManagerViewController {
            objSegue.dataManagerModel = sender as? DataManagerModel
            objSegue.titleText = titleNextView
        }
    }
}


extension TopicManagerViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return subTopicManagerModelArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex.contains(section){
            if let objSubTopic = subTopicManagerModelArray[section].objSubTopic {
                return objSubTopic[0].SubTopicName != "" ? objSubTopic.count : 0
            }
            return 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let introdataCell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: TopicTableViewCell.self)) as! TopicTableViewCell
        var index = indexPath.row
        let objSubTopic = self.subTopicManagerModelArray[indexPath.section].objSubTopic?[indexPath.row]
        introdataCell.topicName.text = objSubTopic?.SubTopicName
        introdataCell.viewTopic.backgroundColor = UIColor.getColor(&index)
        return introdataCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objDataMagerModel = self.subTopicManagerModelArray[indexPath.section].objSubTopic?[indexPath.row]
        self.titleNextView = self.subTopicManagerModelArray[indexPath.section].objSubTopic?[indexPath.row].SubTopicName
        self.performSegue(withIdentifier: SegueId.segueSubTopicManager, sender: objDataMagerModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
            String.init(describing: CustomHeader.self)) as? CustomHeader
        let objTopic = self.subTopicManagerModelArray[section]
        
        headerView?.btnCustomView.tag = section
        headerView?.lblCustomView.text = objTopic.objTopic?.TopicName
        headerView?.reloadmyData = {
            if self.selectedIndex.contains(section) {
                self.selectedIndex.remove(at: self.selectedIndex.firstIndex(of: section)!)
                self.topicTable.reloadData()
            }else{
                if let objSubTopic = self.subTopicManagerModelArray[section].objSubTopic {
                    if objSubTopic.count > 0 {
                        if objSubTopic[0].SubTopicName != "" {
                            self.selectedIndex.removeAll()
                            self.topicTable.reloadData()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                self.selectedIndex.append(section)
                                self.animateTable(TableName: self.topicTable, index: section)
                            })
                        }else{
                            let objDataMagerModel = self.subTopicManagerModelArray[section].objSubTopic?[0]
                            self.titleNextView = self.subTopicManagerModelArray[section].objTopic?.TopicName
                            self.performSegue(withIdentifier: SegueId.segueSubTopicManager, sender: objDataMagerModel)
                        }
                    }
                }
            }
        }
        return headerView
    }
}


extension UIViewController {
    func animateTable(TableName : UITableView,index:Int) {
        TableName.reloadData()
        TableName.setContentOffset(.zero, animated:true)
        let cells = TableName.visibleCells
        let tableHeight = TableName.bounds.size.width
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
        }
        var index = 0
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [], animations: ({
                // do stuff
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }), completion: nil)
            index += 1
        }
    }
}
