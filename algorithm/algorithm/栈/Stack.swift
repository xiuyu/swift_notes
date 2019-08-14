//
//  Stack.swift
//  algorithm
//
//  Created by xiuyu on 2019/7/30.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class Stack<Element> {
    var stack: [Element] = [Element]()
    
    var isEmpty: Bool { return stack.isEmpty }
    
    var peek: Element? { return stack.last }
    
    func push(any: Element) {
        stack.append(any)
    }
    
    func pop() -> Element? {
        if !isEmpty {
            return stack.removeLast()
            
        } else {
            return nil
        }
    }
}
