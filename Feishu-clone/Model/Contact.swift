//
//  Contact.swift
//  Feishu-clone
//
//  Created by Kyle Huang on 2025/4/26.
//

import UIKit
import Foundation

enum ContactType:String {
    case bot = "机器人"
    case external = "外部"
    case user
}

struct Contact {
    var avatar: UIImage?
    var name: String
    var latestMsg: String
    var datetime: String
    var type: ContactType = .user
}
