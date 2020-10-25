//
//  EnumViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

import UIKit


/// 原始值
enum StudentType: Int {
    case pupil = 5
    case middle = 10
    case college = 15
}

/// 关联值
enum StudentType2 {
    case pupil(String)
    case middle(Int, String)
    case college(Int, String)
}

class EnumViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = StudentType(rawValue: 10)

        let stu = StudentType2.pupil("小学生")

        switch stu {
        case let .pupil(name):
            print(name)
        case let .college(age, name):
            print(age, name)
        default:
            break
        }
        
    }
}
