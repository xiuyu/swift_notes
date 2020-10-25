//
//  ViewController.swift
//  swiftTest
//
//  Created by 丘秀玉 on 2020/9/16.
//  Copyright © 2020 xiuyu. All rights reserved.
//

import Kingfisher
import PromiseKit
import SnapKit
import UIKit

extension Array where Element == String {
    func isStringElement() -> Bool {
        return true
    }
}

protocol Test: class {
    associatedtype T
    func some(t:T)
}

class TT:Test {
    typealias T = Int
   
    func some(t: Int) {
        
    }
   
}

class LazyClass {
    
    lazy var someLazy:Int = {
        print("some")
        return 1
    }()
}



class ViewController: UIViewController {
    
    enum DividerError:Error {
        case EquaZeroError;
    }
    
    var myclosure :((_ a:Int)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(["1", "2"].isStringElement())
        
 
//        LazyClass()
        
        
//        nsurlpro
//        pp(left: false, right: B)
        
        var value:String? = "1"
        var result = value.flatMap { Int($0)}.map { $0 * 2 }
//        /// ""Optional(2)"
//        print(result)
        
//        let value = "1"
        
//        value.flatMap{Int($0)}.map{$0 * 2}
//        print(value.flatMap({Int($0)}).map)
        
  
        
    }
    
    
  
    
 
    
    
     func pp(left:Bool,right:@autoclosure()->Bool) -> Bool {
        if left {
            return true
        }else{
            return right()
        }
    }
    
    
    func divide(_ a:Double,_ b:Double) throws -> Double {
        guard a == 0 else {
            throw DividerError.EquaZeroError
        }
        return a / b
    }
  
    
    typealias success = (_ a: Int) -> Void
    
    func min<T: Comparable>(_ a: T, _ b: T) -> T {
        if a > b {
            return a
        }
        return b
    }

    
    func imageLoad() {
        let img = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let url = URL(string: "http://mvimg2.meitudata.com/55fe3d94efbc12843.jpg")
        
        img.kf.setImage(with: url)
        view.addSubview(img)
    
    }
}


