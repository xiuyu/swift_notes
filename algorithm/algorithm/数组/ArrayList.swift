//
//  Array.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/8/20.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

struct ArrayList: List {
    func size() -> Int {
        return count
    }
    
    mutating func add(item: Int) {
        add(index: count, item: item)
    }
    
    mutating func add(index: Int, item: Int) {
        ensureCapacity(capacity: size() + 1)
        
        if index <= count {
            let i = index + 1
            for j in (i..<items.count).reversed() {
                items[j] = items[j - 1]
            }
            
            items[index] = item
            
            count += 1
        }
        else {
            print("index \(index) out of array count \(count)")
        }
    }
    
    // 是否需要扩容
    mutating func ensureCapacity(capacity: Int) {
        let oldCapacity = items.count
        
        if oldCapacity >= capacity { return }
        
        let newCapacity = oldCapacity + oldCapacity >> 1
        
        var newItems = Array(repeating: 0, count: newCapacity)
        
        for i in 0..<items.count {
            newItems[i] = items[i]
        }
        
        items = newItems
    }
    
    mutating func remove(index: Int) -> Int {
        let old = items[index]
        for i in index..<items.count - 1 {
            items[i] = items[i + 1]
        }
        count -= 1
        
        return old
    }
    
    mutating func clear() {
        count = 0
    }
    
    func isEmpty() -> Bool {
        return count == 0
    }
    
    func indexOf(item: Int) -> Int {
        for (i, element) in items.enumerated() {
            if element == item {
                return i
            }
        }
        return ArrayList.ELEMENT_NO_FOND
    }
    
    func contains(item: Int) -> Bool {
        return indexOf(item: item) != ArrayList.ELEMENT_NO_FOND
    }
    
    func get(index: Int) -> Int {
        return items[index]
    }
    
    mutating func set(index: Int, item: Int) {
        items[index] = item
    }
    
    private static let DEFAULT_CAPACITY: Int = 5
    
    private static var ELEMENT_NO_FOND = -1
    
    private var items = Array(repeating: 0, count: DEFAULT_CAPACITY)
    
    private var count: Int = 0
    
    typealias ItemType = Int
}
