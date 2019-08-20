//
//  HomeViewController.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import SnapKit
import UIKit
import YYKit

protocol Container {
    associatedtype ItemType:Equatable
    
    mutating func append(item: ItemType)
    
    var count: Int { get }
    
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    var items = [ItemType]()
    mutating func append(item: Int) {
        self.items.append(item)
    }
    
    var count: Int {
        return self.items.count
    }
    
    subscript(i: Int) -> Int {
        return self.items[i]
    }
    
    typealias ItemType = Int
}

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .black
        
//        let age = -3
//        assert(age > 0, "A person's age cannot be less than zero")
        
        self.setUpUI()
        
        PersonOC.print()
        
//        let net = NetWorking()
        
//        net.request()
        
        let addTwo = addTo(adder: 2)
        
        let result = addTwo(6)
        
        print(result)
        
        let greaterThan10 = greaterThan(compare: 10)
        
        print(greaterThan10(9))
        print(greaterThan10(13))
        
        logIfTrue(2 > 1)
        
        
     
    }
    
    func reverse<T>(_ chars: inout [T],_ start:Int,_ end:Int)  {
        
        var start = start , end = end
        
        while start > end {
            swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
    func swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
        (chars[p], chars[q]) = (chars[q], chars[p])
    }
    
    func findIndex<T: Equatable>(param: T, array: [T]) -> Int? {
        for (i, item) in array.enumerated() {
            if item == param {
                return i
            }
        }
        return nil
    }
    
    func myMethod(obj: AnyObject) {
        objc_sync_enter(obj)
        
        //// 在 enter 和 exit 之间 anObj 不会被其他线程改变
        objc_sync_exit(obj)
    }
    
    // 自动闭包
    func logIfTrue(_ predicate: @autoclosure () -> Bool) {
        if predicate() {
            print("True")
        }
    }
    
    @objc func commonFun() {
    }
    
    @objc func commonFun(num: Int) {
    }
    
    // 坷里化
    func addTo(adder: Int) -> (Int) -> Int {
        return {
            num in
            num + adder
        }
    }
    
    func greaterThan(compare: Int) -> (Int) -> Bool {
        return {
            num in
            num > compare
        }
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
