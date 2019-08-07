//
//  PersonViewController.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import SnapKit
import UIKit

class PersonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let phoneNum: NSMutableString = "18718748418"
    
    let cardNum: NSMutableString = "8102013002001067518"
    
    var tableView: UITableView!
    
    static var identify = "PersonViewCell"
    
    let array = [["账单", "余额"], ["安全", "设置"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = viewBackGroundColor
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .black
        
        self.setUpUI()
    }
    
    func setUpUI() {
        let insets = self.view.safeAreaInsets
        
        let layoutFrame = self.view.safeAreaLayoutGuide
        
        print(insets)
        print(layoutFrame)
        
        let y =  device_is_iPhoneX ? 24 : 0
        
        // -------- backGound ----------//
        let gridentLayer = CAGradientLayer()
        let topColor = UIColor(red: 0xfe / 255, green: 0xd3 / 255, blue: 0x2f / 255, alpha: 1)
        let bottomColor = UIColor(red: 0xfc / 255, green: 0x68 / 255, blue: 0x20 / 255, alpha: 1)
        
        gridentLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gridentLayer.locations = [0, 1]
        gridentLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gridentLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gridentLayer.frame = CGRect(x: 0, y: 0, width: Int(screenWidth), height: 175 + y)
        self.view.layer.addSublayer(gridentLayer)
        
        // -------- name ----------//
        let nameLab = UILabel()
        nameLab.text = "xxx"
        nameLab.font = UIFont(name: "PingFang-SC-Medium", size: 24)
        nameLab.textColor = UIColor.white
        self.view.addSubview(nameLab)
        
        nameLab.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.top.equalTo(65 + y)
        }
        
        // -------- phone ----------//
        let phoneLab = UILabel()
        phoneLab.textColor = UIColor.white
        phoneLab.font = UIFont(name: "PingFang-SC-Regular", size: 15)
        let p = phoneNum.replacingCharacters(in: NSRange(location: 3, length: 6), with: "******")
        phoneLab.text = "手机号：\(p)"
        self.view.addSubview(phoneLab)
        
        phoneLab.snp.makeConstraints {
            $0.top.equalTo(nameLab.snp.bottom).offset(13)
            $0.left.equalTo(nameLab)
        }
        
        // -------- card ----------//
        let cardLab = UILabel()
        cardLab.textColor = UIColor.white
        cardLab.font = UIFont(name: "PingFang-SC-Regular", size: 15)
        let c = cardNum.replacingCharacters(in: NSRange(location: 3, length: 11), with: "***********")
        cardLab.text = "民生卡号：\(c)"
        self.view.addSubview(cardLab)
        
        cardLab.snp.makeConstraints {
            $0.top.equalTo(phoneLab.snp.bottom)
            $0.left.equalTo(nameLab)
        }
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        tableView.separatorColor = lineBackGroundColor
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.width.equalTo(screenWidth)
            $0.top.equalTo(y + 175)
            $0.height.equalTo(45 * 4 + 8)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = array[section]
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 8
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 8))
        view.backgroundColor = viewBackGroundColor
        view.layer.borderColor = lineBackGroundColor.cgColor
        view.layer.borderWidth = 0.5
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: PersonViewController.identify) as? PersonViewCell
        
        if cell == nil {
            cell = PersonViewCell(style: .default, reuseIdentifier: PersonViewController.identify)
        }
        let a: Array = array[indexPath.section]
        cell?.leftLabel.text = a[indexPath.row]
        
        return cell!
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
}
