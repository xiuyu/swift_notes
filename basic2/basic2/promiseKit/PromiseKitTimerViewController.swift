//
//  PromiseKitTimerViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/24.
//

import UIKit

class PromiseKitTimerViewController: UIViewController {
    @objc dynamic var message = "test"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeMessage), userInfo: nil, repeats: true)
    }
    
    @objc func changeMessage(){
        self.message.append("!")
    }
    
    func observeMessage(){
        
        self.observe(.promise, keyPath: #keyPath(PromiseKitTimerViewController.message))
            .done { (value) in
                print(value ?? "")
                // 继续观察
                self.observeMessage()
            }
    }
}
