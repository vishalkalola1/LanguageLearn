//
//  TopicTableViewCell.swift
//  SwiftLearner
//
//  Created by vishal on 07/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell {

    
    @IBOutlet var topicName: UILabel!
    @IBOutlet var viewTopic: CustomViewClass!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
