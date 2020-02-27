//
//  List.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/8/14.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class LinkList {
    static func add(p: ListNode?, val: Any) -> ListNode? {
        var node = p
        
        if node == nil {
            node = ListNode(val: val)
        } else {
            node?.next = LinkList.add(p: node?.next, val: val)
        }
        
        return node
    }
    
    
    /// 递归的方式
    /// - Parameter head: 头结点
    static func reverse(head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        
        let newHead = reverse(head: head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return newHead
    }
    
    
    /// 非递归
    /// - Parameter head: 头结点
    static func reverse2(head: ListNode?) -> ListNode? {
       
        if head == nil || head?.next == nil {
            return head
        }
        
        var newHead:ListNode?
        var h = head
        
     
        while h != nil {
            let temp = h?.next
            h?.next = newHead
            newHead = h
            h = temp
        }
        return newHead
    }
}
