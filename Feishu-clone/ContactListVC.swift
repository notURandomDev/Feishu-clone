//
//  ViewController.swift
//  Feishu-clone
//
//  Created by Kyle Huang on 2025/4/26.
//

import UIKit

class ContactListVC: UIViewController {
    
    var tableView = UITableView()
    var contacts: [Contact] = []
    
    struct Cells {
        static let contactCell = "ContactCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feishu Messages"
        contacts = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ContactCell.self, forCellReuseIdentifier: Cells.contactCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }


}

extension ContactListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.contactCell) as! ContactCell
        let contact = contacts[indexPath.row]
        cell.set(contact: contact)
        
        return cell
    }
}

extension ContactListVC {
    func fetchData() -> [Contact] {
        
        return [
            // 2025-04-26（当天，显示 hh:mm）
            
            Contact(avatar: Contacts.meetingBot, name: "视频会议助手", latestMsg: "智能纪要：第一期线上课程分享《走进客户端》", datetime: "23:50", type: .bot),
            Contact(avatar: Contacts.ywh, name: "严文华", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "23:40", type: .external),
            Contact(avatar: Contacts.contactBot, name: "联系人助手", latestMsg: "联系人申请", datetime: "23:45", type: .bot),
            Contact(avatar: Contacts.xkq, name: "肖凯琴", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "23:35", type: .external),
            Contact(avatar: Contacts.sp, name: "苏鹏", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "23:25", type: .external),

            // 2025-04-25（前一天，显示 "昨天"）
            Contact(avatar: Contacts.accountBot, name: "账号安全中心", latestMsg: "安全登录通知", datetime: "昨天", type: .bot),
            Contact(avatar: Contacts.lwx, name: "梁惟熙", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "昨天", type: .external),
            Contact(avatar: Contacts.group1, name: "飞书技术训练营-客户端专场-iOS", latestMsg: "严文华：@所有人 hi~大家下午好！第一期线上课程分享", datetime: "昨天", type: .external),
            Contact(avatar: Contacts.ljh, name: "厉剑豪", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "昨天", type: .user),
            Contact(avatar: Contacts.jy, name: "蒋元", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "昨天", type: .external),
            

            // 2025-04-24（两天前，显示 "M月d日"）
            Contact(avatar: Contacts.wx, name: "王恂", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "4月24日", type: .external),
            Contact(avatar: Contacts.docBot, name: "云文档助手", latestMsg: "权限变更", datetime: "4月24日", type: .bot),
            Contact(avatar: Contacts.zjl, name: "张纪龙", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "4月24日", type: .user),
            Contact(avatar: Contacts.group2, name: "飞书技术训练营-客户端专场-咨询群", latestMsg: "西南财经大学-计算机-孟靖文：ak都这样，我被刷心服口服", datetime: "4月24日", type: .external),
            Contact(avatar: Contacts.cwl, name: "曹文龙", latestMsg: "我接受了你的联系人申请，开始聊天吧！", datetime: "4月24日", type: .user)
        ]
    }
}
