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
        
        
    }
}
