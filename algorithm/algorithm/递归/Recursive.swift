//
//  Resursive.swift
//  algorithm
//
//  Created by 丘秀玉 on 2020/2/26.
//  Copyright © 2020 xiuyu. All rights reserved.
//

import Foundation


/// 递归出口(终止递归的条件)
/// 递归表达式(规律)


class Recursive {
    /// 1 1 2 3 5 8
    /// - Parameter n: 斐波那契数列
    func fibo(n: Int) -> Int {
        if n <= 1 {
            return n
        }
        
        return fibo(n: n - 2) + fibo(n: n - 1)
    }
    
    func fibo2(n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var first = 0
        var second = 1
        
        for _ in 1..<n {
            second += first
            first = second - first
        }
        return second
    }
    
    /// 查找最大的元素
    /// - Parameters:
    ///   - array: 数组
    ///   - L: <#L description#>
    ///   - R: <#R description#>
    func findMax(array: [Int], L: Int, R: Int) -> Int {
        if L == R {
            return array[L]
        }
        
        let a = array[R]
        let b = findMax(array: array, L: L + 1, R: R)
        
        if a > b {
            return a
        } else {
            return b
        }
    }
    
    /// 1+2+3+4+5+6 sum(n-1) + n
    /// - Parameter n: N项之和
    func sum(n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return sum(n: n - 1) + n
    }
}
