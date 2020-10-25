//
//  ErrorViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

import UIKit

enum MyError: Error {
    case errorOne
    case errorTwo
    
    var localizedDescription: String {
        let desc = self == .errorOne ? "err one" : "err two"
        return desc
    }
}


/// error
struct MyStructError: Error {
    var errCode: Int = 0
    
    var localizedDescription: String {
        return "the error code is \(errCode)"
    }
}

class ErrorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       
        do {
            let a = try foo(a: -20)
            print(a)
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    
    /// 异常
    /// - Parameter a: int
    /// - Throws: 抛出异常
    /// - Returns: 返回
    func foo(a: Int) throws -> Int {
        if a < -10 {
            throw MyError.errorOne
        } else if a > 10 {
            throw MyError.errorTwo
        } else if a == 0 {
            throw MyStructError(errCode: -1)
        }
        return a
    }
}
