//
//  ClosureViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

import UIKit

class ClosureViewController: UIViewController {
    var closure: ((String) -> ())?
    
    var callBack: ((String) -> ())?
    
    //懒加载
    lazy var greeting:String = {
        return "hello"
    }()
    
    
    lazy var tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///循环强引用
        printString { [weak self] text in
            print(text)
            self?.view.backgroundColor = UIColor.red
        }
        
        /// 传值
        if closure != nil {
            closure!("back")
        }
        
        combine(num: 100) { str1, str2 in
            print(str1)
            print(str2)
        }
    }
    
    func printString(callBack: @escaping (String) -> ()) {
        callBack("这个闭包返回一段文字")
        
        self.callBack = callBack
    }
    
    /// 尾随闭包
    func combine(num: Int, handle: (String, String) -> ()) {
        handle("hello", "word \(num)")
    }
    
    func s() {
        let addCloser: (String, String) -> (String) = {
            "\($0) with \($1)"
        }
        
        print(addCloser("tom", "20"))
    }
    
    func simple() {
        let addCloser1: (Int, Int) -> (Int) = {
            num1, num2 in
            num1 + num2
        }
        
        print(addCloser1(10, 30))
    }
    
    func add() {
        typealias Add = (_ a: Int, _ b: Int) -> (Int)
        
        let add: Add = {
            (num1: Int, num2: Int) -> (Int) in
            num1 + num2
        }
        
        add(20, 30)
    }
}
