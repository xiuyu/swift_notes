//
//  Stack.swift
//  algorithm
//
//  Created by xiuyu on 2019/7/30.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import Foundation

protocol Stack {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
}

struct IntStack: Stack {
    var items = [Element]()
    var isEmpty: Bool { return items.isEmpty }
    
    var peek: Int? { return items.last }
    
    mutating func push(_ element: Int) {
        items.append(element)
    }
    
    mutating func pop() -> Int? {
        if !items.isEmpty {
            return items.removeLast()
        } else {
            return nil
        }
    }
    
    typealias Element = Int
}
