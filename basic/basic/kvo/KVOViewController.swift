//
//  KVOViewController.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/20.
//

import UIKit

class KVOViewController: UIViewController {
    
    var person:PersonKVO?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {

        if let key = keyPath {
            if key == "title" {
                print(key)
            }
        }
        
    }
    
    func kvo() {
        person = PersonKVO(title: "title")
//        person.title = "test"
        
        person?.setValue("kvc", forKey: "title")
        
        person?.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
}
