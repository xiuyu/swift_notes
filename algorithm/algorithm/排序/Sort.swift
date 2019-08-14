//
//  Sort.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/8/14.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class Sort: NSObject {
    /// 堆排序
    ///
    /// - Parameter array: 待排数组
    func heapSort(array: inout Array<Int>) {
        let end = (array.count - 1) / 2
        for i in (0...end).reversed() {
            maxHeap(array: &array, size: array.count, index: i)
        }
        
        for i in (0..<array.count).reversed() {
            array.swapAt(0, i)
            
            maxHeap(array: &array, size: i, index: 0)
        }
    }
    
    /// 把数组转成大顶堆
    ///
    /// - Parameters:
    ///   - array: 数组
    ///   - size: 长度
    ///   - index: 位置
    func maxHeap(array: inout Array<Int>, size: Int, index: Int) {
        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2
        
        var max = index
        
        if leftIndex < size && array[leftIndex] > array[max] {
            max = leftIndex
        }
        if rightIndex < size && array[rightIndex] > array[max] {
            max = rightIndex
        }
        
        if max != index {
            array.swapAt(index, max)
            maxHeap(array: &array, size: size, index: max)
        }
    }
    
    /// 插入排序
    ///
    /// - Parameter array: 待排数组
    func insertSort(array: inout Array<Int>) {
        for i in 1..<array.count {
            let temp = array[i]
            
            for j in (0...i - 1).reversed() {
                if temp < array[j] {
                    array.swapAt(j, j + 1)
                }
            }
        }
    }
    
    /// 希尔排序
    ///
    /// - Parameter array: 待排数组
    func shellSort(array: inout Array<Int>) {
        var gap = array.count / 2
        
        while gap >= 1 {
            for i in gap..<array.count {
                for j in (gap...i).reversed() {
                    if array[j] > array[j - gap] {
                        array.swapAt(j, j - gap)
                    }
                }
            }
            
            gap = gap / 2
        }
    }
    
    /// 快排
    ///
    /// - Parameters:
    ///   - array: 待排数组
    ///   - leftIndex: left
    ///   - rightIndex: right
    func quickSort(array: inout Array<Int>, leftIndex: Int, rightIndex: Int) {
        if leftIndex > rightIndex {
            return
        }
        
        var i = leftIndex
        var j = rightIndex
        
        let key: Int = array[i]
        
        while i < j {
            while i < j && key <= array[j] {
                j -= 1
            }
            array[i] = array[j]
            
            while i < j && key >= array[i] {
                i += 1
            }
            
            array[j] = array[i]
        }
        
        array[i] = key
        
        quickSort(array: &array, leftIndex: leftIndex, rightIndex: i - 1)
        quickSort(array: &array, leftIndex: i + 1, rightIndex: rightIndex)
    }
    
    /// 冒泡排序
    ///
    /// - Parameter array: 待排数组
    func bubbleSort(array: inout Array<Int>) {
        for _ in 0..<(array.count - 1) {
            for j in 0..<(array.count - 1) {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
            }
        }
    }
    
    /// 选择排序
    ///
    /// - Parameter array: 待排数组
    func selectSort(array: inout Array<Int>) {
        for i in 0..<(array.count - 1) {
            for j in (i + 1)..<array.count {
                if array[i] > array[j] {
                    array.swapAt(i, j)
                }
            }
        }
    }
    
    /// 二分法查找
    ///
    /// - Parameters:
    ///   - array: 数组
    ///   - num: 要查找的数字
    /// - Returns: 返回数组的index
    func binarySearch(array: Array<Int>, search num: Int) -> Int {
        var min = 0
        var max = array.count - 1
        
        var mid = (min + max) / 2
        
        while min <= max {
            if num == array[mid] {
                return mid
            } else if num > array[mid] {
                min = mid + 1
            } else {
                max = mid - 1
            }
            
            mid = (min + max) / 2
        }
        
        return -1
    }
}
