//
//  TopicManagerModel.swift
//  SwiftLearner
//
//  Created by vishal on 07/04/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import Foundation

class TopicManagerModel: Decodable {
    let MainTopicId : String?
    let TopicId : String?
    let TopicName : String?
}

class TopicManagerWithDataManagerModel: Decodable {
    var objTopic : TopicManagerModel?
    var objSubTopic : [DataManagerModel]?
}
