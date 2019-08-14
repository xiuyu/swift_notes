//
//  BinaryTree.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/8/14.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class BinaryTree {
    private var root: TreeNode?
    
    /// 二叉树添加元素
    ///
    /// - Parameter val: val
    func addTreeNode(val: Int) {
        let newNode = TreeNode(val: val)
        
        var current = root
        
        if root == nil {
            root = newNode
        } else {
            while current != nil {
                let parent = current
                if current!.val > val {
                    current = current?.leftNode
                    
                    if current == nil {
                        parent?.leftNode = newNode
                    }
                } else {
                    current = current?.rightNode
                    
                    if current == nil {
                        parent?.rightNode = newNode
                    }
                }
            }
        }
    }
    
    /// 二叉树删除元素
    ///
    /// - Parameter val: 元素
    func delete(val: Int) {
        var current = root
        
        var parent: TreeNode?
        
        while val != current!.val {
            parent = current
            
            if current!.val > val {
                current = current?.leftNode
            } else if current!.val < val {
                current = current?.rightNode
            }
            
            if current == nil {
                break
            }
        }
        
        // 删除的元素没有子节点
        // 删除的元素有左右子节点
        // 删除的元素有左或右子节点
        if current?.leftNode == nil && current?.rightNode == nil {
            if parent?.leftNode != nil {
                parent?.leftNode = nil
            }
            
            if parent?.rightNode != nil {
                parent?.rightNode = nil
            }
        } else if current?.leftNode != nil && current?.rightNode != nil {
            
            
            
        } else {
            
            if current?.leftNode != nil {
                parent?.leftNode = current?.leftNode
            }else if current?.rightNode != nil{
                parent?.rightNode = current?.rightNode
            }
        }
    }
    
    /// 前序排序
    func preOrder() {
        preOrder(current: root)
    }
    
    /// 中序排序
    func midOrder() {
        midOrder(current: root)
    }
    
    /// 后续排序
    func postOrder() {
        postOrder(current: root)
    }
    
    func preOrder(current: TreeNode?) {
        if current != nil {
            print(current!.val)
            preOrder(current: current?.leftNode)
            preOrder(current: current?.rightNode)
        }
    }
    
    func midOrder(current: TreeNode?) {
        if current != nil {
            midOrder(current: current?.leftNode)
            print(current!.val)
            midOrder(current: current?.rightNode)
        }
    }
    
    func postOrder(current: TreeNode?) {
        if current != nil {
            postOrder(current: current?.leftNode)
            postOrder(current: current?.rightNode)
            print(current!.val)
        }
    }
}
