//
//  Algorithm.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/21.
//

import Foundation

struct Algorithm {
    
    init() {
        
    }

    
    //给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值
    func twoSum(_ array:[Int],_ target:Int) -> Bool {
        
        var set = Set<Int>()
        
        for item in array {
            
            if set.contains(target - item) {
                return true
            }
            set.insert(item)
        }
    
        return false
    }
    
   
    func twoSum2(_ array:[Int], _ target:Int) -> [Int]? {
        var dict = Dictionary<Int,Int>()
        
        for (i,num) in array.enumerated() {
            
            if let index = dict[target - num] {
                return [index,i]
            }else{
                dict[num] = i
            }
        }
        
        return nil
    }
    
    func swap(_ a:inout Int,_ b:inout Int)  {
        
        a = a + b
        b = a - b
        a = a - b
    }
    
    func swap2(_ a:inout Int,_ b:inout Int)  {
        
        a = a ^ b
        b = a ^ b
        a = a ^ b
    }
    
//    func swap<T>(_ a: inout T, _ b: inout T) {
//        (a, b) = (b, a)
//    }

    func divide(dividend: Double?, by divisor: Double?) -> Double? {
        guard let divide = dividend, let divisor = divisor, divisor != 0 else {
            return nil
        }
        
        return divide / divisor
    }
    
    //扩展：最小公倍数 = (a * b)/最大公约数
    func maxCommonDivisor(_ a:Int ,_ b:Int) -> Int {
        var max = 0
        
        for i in 1...b {
            
            if a % i == 0 && b % i == 0 {
                max = i
            }
        }
        
        return max
    }
}
