//
//  StructViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

import UIKit

struct Student {
    var chinese: Int
    var math: Int
    var english: Int

    init(chinese: Int, math: Int, english: Int) {
        self.chinese = chinese
        self.math = math
        self.english = english
    }

    mutating func changeChinese(num: Int) {
        self.chinese += num
    }

//    func changeChinese(num:Int,stu:inout Student)  {
//        stu.chinese += num
//    }
}


class StructViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
