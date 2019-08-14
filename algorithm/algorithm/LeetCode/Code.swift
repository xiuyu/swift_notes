//
//  Code.swift
//  algorithm
//
//  Created by xiuyu on 2019/7/30.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class Code: NSObject {

    /// 给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值
    func twosum(array: [Int], target: Int) -> Bool {
        var set: Set<Int> = Set()
        
        for num in array {
            if set.contains(target - num) {
                return true
            }
            
            set.insert(num)
        }
        
        return false
    }
}
