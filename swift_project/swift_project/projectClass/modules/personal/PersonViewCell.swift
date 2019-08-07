//
//  PersonViewCell.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import SnapKit
import UIKit

class PersonViewCell: UITableViewCell {
    var leftLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        leftLabel = UILabel()
        leftLabel.font = UIFont(name: "PingFang_SC_Regular", size: 17)
        addSubview(leftLabel)
        
        leftLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalTo(self)
        }
        
        let img = UIImageView()
        img.image = UIImage(named: "right_back")
        addSubview(img)
        
        img.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(-20)
            make.size.equalTo(CGSize(width: 8, height: 13))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
