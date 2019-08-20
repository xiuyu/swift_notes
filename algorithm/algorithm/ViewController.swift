//
//  ViewController.swift
//  algorithm
//
//  Created by xiuyu on 2019/7/25.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
       let tree = BinaryTree()
    
        tree.addTreeNode(val: 8)
        tree.addTreeNode(val: 7)
        tree.addTreeNode(val: 9)
        tree.addTreeNode(val: 6)
        tree.addTreeNode(val: 10)
//        tree.midOrder()
        tree.delete(val: 9)
        
  
        
        var array = ArrayList()
        array.add(item: 1)
        array.add(item: 4)
        array.add(index: 3, item: 3)
        array.add(item: 5)
        array.add(index: 1, item: 10)
        array.add(item: 7)
        array.add(item: 9)
        
        array.remove(index: 1)

    
    }
}




