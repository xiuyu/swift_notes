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
        
//       let tree = BinaryTree()
//
//        tree.addTreeNode(val: 8)
//        tree.addTreeNode(val: 7)
//        tree.addTreeNode(val: 9)
//        tree.addTreeNode(val: 6)
//        tree.addTreeNode(val: 10)
        ////        tree.midOrder()
//        tree.delete(val: 9)
        
//        var array = ArrayList()
//        array.add(item: 1)
//        array.add(item: 4)
//        array.add(index: 3, item: 3)
//        array.add(item: 5)
//        array.add(index: 1, item: 10)
//        array.add(item: 7)
//        array.add(item: 9)
//
//        array.remove(index: 1)
//
//
//
//        var arr = [1,5,6]
//
//        let arr2 = arr.myMap { (value) -> (Int) in
//
//            return value * value
//        }
//
//        print(arr2)
        

      
//        let p = LinkList.add(p: nil, val: 5)
//        let pp = LinkList.add(p: p, val: 4)
//        let ppp = LinkList.add(p: pp, val: 3)
//        let pppp = LinkList.add(p: ppp, val: 2)
//        _ = LinkList.add(p: pppp, val: 1)
//
//
//       let node =  LinkList.reverse2(head: p)
        
        
//        let str = "中文"
//
//        print(str.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: str)))
//        
//        
//        print(str.data(using: .utf8)?.base64EncodedString())
//        
//        
//        print(str.hashValue)
        
        
        
        
    }
    
 
    

}

extension Array {
    func myMap<T>(_ transforms: (Element) -> (T)) -> [T] {
        var tmp: [T] = []
        tmp.reserveCapacity(count)
        
        for value in self {
            tmp.append(transforms(value))
        }
        
        return tmp
    }
}
