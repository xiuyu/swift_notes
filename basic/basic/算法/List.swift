//
//  List.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/21.
//

import Foundation

class List {
    var head: ListNode?
    var tail: ListNode?
    
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            let temp = ListNode(val)
            tail!.next = temp
            tail = temp
        }
    }
    
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    
    //两个指针访问链表，一个在前一个在后，或者一个移动快另一个移动慢，这就是快行指针。
    //所以如何检测一个链表中是否有环？用两个指针同时访问链表，其中一个的速度是另一个的2倍
    func hasCycle(_ head: ListNode?) -> Bool {
      var slow = head
      var fast = head
      
      while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
        
        if slow === fast {
          return true
        }
      }
      
      return false
    }
    
    //给一个链表和一个值x，要求只保留链表中所有小于x的值，原链表的节点顺序不能变。
//        例：1->5->3->2->4->2，给定x = 3。则我们要返回 1->2->2
    
    func getLeftList(_ head: ListNode?, _ x: Int) -> ListNode? {
      let dummy = ListNode(0)
      var pre = dummy
      var node = head

      while node != nil {
        if node!.val < x {
          pre.next = node
          pre = node!
        }
        node = node!.next
      }

      node!.next = nil
      return dummy.next
    }
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        // 引入Dummy节点
        let prevDummy = ListNode(0)
        var prev = prevDummy
        let postDummy = ListNode(0)
        var post = postDummy
        
        var node = head
        
        while node != nil {
            if node!.val < x {
                prev.next = node!
                prev = node!
            }else{
                post.next = node!
                post = node!
            }
            
            node = node!.next
        }
        
        prev.next = nil
        prev.next = postDummy.next
        
        return prevDummy.next
    }
}
