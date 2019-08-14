//
//  AsyncAfter.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class AsyncAfter {
    public static func asyncAfter(_ seconds: Double, _ task: @escaping Task) {
        _asyncAfter(seconds, task)
    }
    
    public static func asyncAfter(_ seconds: Double, _ task: @escaping Task, _ mainTask: @escaping Task) {
        _asyncAfter(seconds, task, mainTask)
    }
    
    private static func _asyncAfter(_ seconds: Double, _ task: @escaping Task, _ mainTask: Task? = nil) {
        let item = DispatchWorkItem(block: task)
        
        DispatchQueue.global().async(execute: item)
        
        if let maim = mainTask {
            item.notify(queue: DispatchQueue.main, execute: maim)
        }
    }
}
