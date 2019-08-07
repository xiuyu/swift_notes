//
//  HomeViewController.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .black
        
        self.setUpUI()
    }
    
    func setUpUI() {
        let y = device_is_iPhoneX ? 24 : 0
        
        let backView = UIView()
        backView.backgroundColor = UIColor(hexString: "#FF9700")
        self.view.addSubview(backView)
        
        backView.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.width.equalTo(screenWidth)
            $0.height.equalTo(75 + y)
        }
        
        let degreeLab = UILabel()
        degreeLab.text = "30°"
        degreeLab.font = UIFont(name: "PingFang-SC-Light", size: 26)
        degreeLab.textColor = UIColor.white
        backView.addSubview(degreeLab)
        
        degreeLab.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.bottom.equalTo(backView.snp.bottom).offset(-9)
        }
        
        let adLab = UILabel()
        adLab.text = "番禺\n下雨"
        adLab.numberOfLines = 2
        adLab.font = UIFont(name: "PingFang-SC-Regular", size: 12)
        adLab.textColor = UIColor.white
        backView.addSubview(adLab)
        
        adLab.snp.makeConstraints {
            $0.left.equalTo(degreeLab.snp.right).offset(8)
            $0.centerY.equalTo(degreeLab)
        }
        
        let messageImg = UIImageView(image: UIImage(named: "message"))
        backView.addSubview(messageImg)
        
        messageImg.snp.makeConstraints {
            $0.centerY.equalTo(degreeLab)
            $0.right.equalTo(backView.snp.right).offset(-20)
        }
        
        let searchView = UIView()
        searchView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        searchView.layer.cornerRadius = 2
        backView.addSubview(searchView)
        
        searchView.snp.makeConstraints {
            $0.left.equalTo(adLab.snp.right).offset(10)
            $0.right.equalTo(messageImg.snp.left).offset(-10)
            $0.height.equalTo(32)
            $0.centerY.equalTo(degreeLab)
        }
        
        let searchImg = UIImageView(image: UIImage(named: "search"))
        searchView.addSubview(searchImg)
        
        searchImg.snp.makeConstraints {
            $0.left.equalTo(8)
            $0.centerY.equalTo(searchView)
        }
        
        let searchLab = UILabel()
        searchLab.text = "搜索"
        searchLab.font = UIFont(name: "PingFang-SC-Regular", size: 13)
        searchLab.textColor = UIColor.white
        searchView.addSubview(searchLab)
        
        searchLab.snp.makeConstraints {
            $0.left.equalTo(searchImg.snp.right).offset(2)
            $0.centerY.equalTo(searchImg)
        }
    }
}
