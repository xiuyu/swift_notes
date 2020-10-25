//
//  KVOViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/25.
//

import UIKit

class KVOViewController: UIViewController {
    let test = KVOTest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.addObserver(self, forKeyPath: #keyPath(KVOTest.name), options: .new, context: nil)
        
        test.name = "ttttt"
        
        let keyPath = \KVOTest.age
        test[keyPath: keyPath] = 10
        
        print(test[keyPath: keyPath])
        
//        test.setValue(2, forKey: "age")
        
//        print(test.value(forKey: #keyPath(KVOTest.age)) ?? 0)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        print("keypath = \(keyPath ?? "")")
    }
    
    deinit {
        test.removeObserver(self, forKeyPath: #keyPath(KVOTest.name))
    }
}
