//
//  Queue.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/8/15.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}

struct IntQueue: Queue {
    var isEmpty: Bool { return items.isEmpty }
    
    var peek: Int? { return items.first }
    
    var items = [Element]()
    
    mutating func enqueue(_ element: Int) {
        items.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if items.isEmpty {
            return nil
        } else {
            return items.first
        }
    }
    
    typealias Element = Int
}
