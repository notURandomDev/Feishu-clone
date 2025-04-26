//
//  Contact.swift
//  Feishu-clone
//
//  Created by Kyle Huang on 2025/4/26.
//

import UIKit

enum ContactType {
    case bot
    case external
    case user
}

struct Contact {
    var avatar: UIImage?
    var name: String
    var latestMsg: String
    var datetime: String
    var type: ContactType = .user
}
