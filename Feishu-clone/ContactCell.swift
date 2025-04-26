//
//  ContactCell.swift
//  Feishu-clone
//
//  Created by Kyle Huang on 2025/4/26.
//

import UIKit

class ContactCell: UITableViewCell {
    var avatarIV = UIImageView()
    var nameLabel = UILabel()
    var tagLabel = UILabel()
    var datetimeLabel = UILabel()
    var msgLabel = UILabel()
    var infoSV = UIStackView()
    var leftView = UIView()
    var firstLineView = UIView()
    
    struct Styles {
        static let avatarSize: CGFloat = 40
        static let pxPrimary: CGFloat = 16
        static let pxSecondary: CGFloat = 12
        static let pyPrimary: CGFloat = 13
        static let textColorSecondary = UIColor.systemGray
        static let fontSizePrimary: CGFloat = 16
        static let fontSizeSecondary: CGFloat = 13
        static let fontWeightPrimary = UIFont.Weight.medium
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configureAvatarIV()
        configureNameLabel()
        configureTagLabel()
        configureLeftView()
        configureDatetimeLabel()
        configureMsgLabel()
        configureFirstLineView()
        configureInfoSV()
        
        addSubview(avatarIV)
        addSubview(infoSV)
        
        setAvatarIVConstaints()
        setNameLabelConstraints()
        setTagLabelConstraints()
        setLeftViewConstraints()
        setDatetimeLabelConstraints()
        setFirstLineViewConstraints()
        setMsgLabelConstaints()
        setInfoSVConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(contact: Contact) {
        avatarIV.image = contact.avatar
        nameLabel.text = contact.name
        msgLabel.text = contact.latestMsg
        datetimeLabel.text = contact.datetime
        
        
        if(contact.type != .user) {
            if(contact.type == .bot) {
                tagLabel.text = " 机器人 "
                tagLabel.textColor = UIColor(red: 172/255.0, green: 123/255.0, blue: 3/255.0, alpha: 1)
                tagLabel.backgroundColor = UIColor(red: 253/255.0, green: 246/255.0, blue: 220/255.0, alpha: 1)
            }
            if(contact.type == .external) {
                tagLabel.text = " 外部 "
                tagLabel.textColor = UIColor(red: 17/255.0, green: 72/255.0, blue: 219/255.0, alpha: 1)
                tagLabel.backgroundColor = UIColor(red: 209/255.0, green: 221/255.0, blue: 253/255.0, alpha: 1)
            }
            tagLabel.isHidden = false
        }
        
    }
    
    func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: Styles.fontSizePrimary, weight: Styles.fontWeightPrimary)
        nameLabel.lineBreakMode = .byTruncatingTail
    }
    
    func configureTagLabel() {
        tagLabel.isHidden = true
        tagLabel.font = .systemFont(ofSize: 11, weight: .semibold)
        tagLabel.clipsToBounds = true
        tagLabel.layer.cornerRadius = 4
    }
    
    func configureLeftView() {
        leftView.addSubview(nameLabel)
        leftView.addSubview(tagLabel)
    }
    
    func configureDatetimeLabel() {
        datetimeLabel.textColor = Styles.textColorSecondary
        datetimeLabel.font = .systemFont(ofSize: Styles.fontSizeSecondary, weight: .semibold)
    }
    
    func configureAvatarIV() {
        avatarIV.layer.cornerRadius = Styles.avatarSize / 2
        avatarIV.clipsToBounds = true
    }
    
    func configureMsgLabel() {
        msgLabel.textColor = Styles.textColorSecondary
        msgLabel.font = .systemFont(ofSize: Styles.fontSizeSecondary, weight: Styles.fontWeightPrimary)
    }
    
    func configureFirstLineView() {
        firstLineView.addSubview(leftView)
        firstLineView.addSubview(datetimeLabel)
    }
    
    func configureInfoSV() {
        infoSV.axis = .vertical
        infoSV.spacing = 8
        infoSV.alignment = .leading
        infoSV.addArrangedSubview(firstLineView)
        infoSV.addArrangedSubview(msgLabel)
    }
    
    func setAvatarIVConstaints() {
        avatarIV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarIV.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarIV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Styles.pxPrimary),
            avatarIV.heightAnchor.constraint(equalToConstant: Styles.avatarSize),
            avatarIV.widthAnchor.constraint(equalToConstant: Styles.avatarSize)
        ])
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leftView.leadingAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            nameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 220)
        ])
    }
    
    func setTagLabelConstraints() {
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            tagLabel.topAnchor.constraint(equalTo: firstLineView.topAnchor),
            tagLabel.bottomAnchor.constraint(equalTo: firstLineView.bottomAnchor)
        ])
    }
    
    func setLeftViewConstraints() {
        leftView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftView.leadingAnchor.constraint(equalTo: firstLineView.leadingAnchor),
            leftView.trailingAnchor.constraint(equalTo: datetimeLabel.leadingAnchor),
            leftView.centerYAnchor.constraint(equalTo: firstLineView.centerYAnchor)
        ])
    }
    
    func setDatetimeLabelConstraints() {
        datetimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datetimeLabel.topAnchor.constraint(equalTo: firstLineView.topAnchor),
            datetimeLabel.trailingAnchor.constraint(equalTo: firstLineView.trailingAnchor),
            datetimeLabel.bottomAnchor.constraint(equalTo: firstLineView.bottomAnchor)
        ])
    }
    
    func setFirstLineViewConstraints() {
        firstLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLineView.leadingAnchor.constraint(equalTo: infoSV.leadingAnchor),
            firstLineView.trailingAnchor.constraint(equalTo: infoSV.trailingAnchor),
            // firstLineView.topAnchor.constraint(equalTo: infoSV.topAnchor)
        ])
    }
    
    func setMsgLabelConstaints() {
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // msgLabel.leadingAnchor.constraint(equalTo: infoSV.leadingAnchor)
        ])
    }
    
    func setInfoSVConstraints() {
        infoSV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoSV.topAnchor.constraint(equalTo: topAnchor, constant: Styles.pyPrimary),
            infoSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Styles.pyPrimary),
            infoSV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Styles.pxPrimary),
            infoSV.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: Styles.pxSecondary)
        ])
    }
}
