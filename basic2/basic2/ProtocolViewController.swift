//
//  ProtocolViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

/////协议冲突
protocol TextOne {
    func text() -> String
}

protocol TextTwo {
    func text() -> Int
}

class Text: TextOne, TextTwo {
    func text() -> Int {
        return 10
    }

    func text() -> String {
        return "hello"
    }
}

//////指定初始化器（构造函数）或者便捷初始化器
protocol Pet : class{
    init(name: String)
}

class Cat: Pet {
    var name: String = "cat"
    required init(name: String) {
        self.name = name
    }
}

/////////////////////
protocol Person {
    // 属性
    var name: String { get set }
    var birthPlace: String { get }
    static var qualification: String { get }

    // 方法
    static func study()
    mutating func changeName()
}

struct Puple: Person {
    static var qualification: String = ""

    var name: String = "test"
    var birthPlace: String = "北京"

    static func study() {
        print("study")
    }

    /// 修改属性
    mutating func changeName() {
        self.name = "小花"
    }
}

import UIKit

class ProtocolViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = Puple(name: "小明", birthPlace: "beijing")

        let txt = Text()
        // 需要指定调用特定协议的text()方法

        let a = (txt as TextOne).text()

        let str = (txt as TextTwo).text()

        print(a)

        print(str)
    }
}



///关联类型
protocol WeightCalculable {
    associatedtype WeightType

    var weight: WeightType { get }
}

struct MobilePhone: WeightCalculable {
    typealias WeightType = Double
    var weight: Double = 1.44
}
