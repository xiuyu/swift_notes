//
//  PersonKVO.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/20.
//

import Foundation

class PersonKVO: NSObject {
    
    init(title:String) {
        self.title = title
    }
    
    static func test(){
        print("test")
    }
    
    @objc dynamic var title:String{
        willSet{
            print("old \(newValue)")
        }
        didSet{
            print("old=\(oldValue)")
        }
        
    }
    
    
}
