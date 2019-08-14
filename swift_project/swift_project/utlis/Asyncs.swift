//
//  Asyncs.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import Foundation

public typealias Task = () -> Void
public struct Asyncs {
    public static func async(_ task: @escaping Task) {
        _async(task)
    }
    
    public static func async(_ task: @escaping Task, _ mainTask: @escaping Task) {
        _async(task, mainTask)
    }
    
    private static func _async(_ task: @escaping Task, _ mainTask: Task? = nil) {
        let item = DispatchWorkItem(block: task)
        
        DispatchQueue.global().async(execute: item)
        
        if let main = mainTask {
            item.notify(queue: DispatchQueue.main, execute: main)
        }
    }
    
    public static func synchronized(lock: AnyObject, closure: () -> Void) {
        objc_sync_enter(lock)
        defer { objc_sync_exit(lock) }
        closure()
    }
}
