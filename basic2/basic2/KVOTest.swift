//
//  KVOTest.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/25.
//

import Foundation

class KVOTest: NSObject {
    @objc dynamic var name: String? {
        willSet {
            print(newValue ?? "")
        }
        
        didSet {
            print(oldValue ?? "")
        }
    }
    
    @objc var age: Int = 0
    
    override init() {
        super.init()
    }
    
    deinit {
        print("deinit")
    }
}
