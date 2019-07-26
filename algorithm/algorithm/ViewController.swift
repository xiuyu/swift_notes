//
//  ViewController.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/7/25.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var array = [1, 9, 7, 5, 10, 2, 12];
        
        //        quickSort(array: &array, leftIndex: 0, rightIndex: array.count - 1);
        
//        shellSort(array: &array)
        
        heapSort(array: &array)
        
        print(array);
    }
    
    
    /// 对排序
    ///
    /// - Parameter array: 待排数组
    func heapSort(array:inout Array<Int>) {
        
        let end  = (array.count - 1) / 2 ;
        for i in (0...end).reversed() {
            maxHeap(array: &array, size: array.count, index: i);
        }
        
        for i in (0..<array.count).reversed() {
            array.swapAt(0, i);
            
            maxHeap(array: &array, size: i, index: 0);
        }
        
    }
    
    
    /// 把数组转成大顶堆
    ///
    /// - Parameters:
    ///   - array: 数组
    ///   - size: 长度
    ///   - index: 位置
    func maxHeap(array:inout Array<Int>,size:Int,index:Int)  {
        
        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2
        
        var max = index;
        
        if leftIndex < size && array[leftIndex] > array[max] {
            max = leftIndex
        }
        if rightIndex < size && array[rightIndex] > array[max] {
            max = rightIndex
        }
        
        if max != index {
            array.swapAt(index, max);
            maxHeap(array: &array, size: size, index: max);
        }
    }
    
    
    /// 希尔排序
    ///
    /// - Parameter array: 待排数组
    func shellSort(array : inout Array <Int>)
    {
       var gap = array.count / 2
        
        while gap >= 1 {
            
            for i in gap..<array.count {
                
                for j in (gap...i).reversed() {
                    
                    if array[j] > array[j - gap] {
                        
                        array.swapAt(j, j - gap)
                    }
                }
            }
            
            gap = gap / 2;
        }
    }
    
    /// 快排
    ///
    /// - Parameters:
    ///   - array: 待排数组
    ///   - leftIndex: left
    ///   - rightIndex: right
    func quickSort(array : inout Array <Int>, leftIndex : Int, rightIndex : Int)
    {
        if leftIndex > rightIndex {
            return;
        }
        
        var i = leftIndex
        var j = rightIndex
        
        let key:Int = array[i]
        
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
        
        array[i] = key;
        
        quickSort(array: &array, leftIndex: leftIndex, rightIndex: i - 1)
        quickSort(array: &array, leftIndex: i + 1, rightIndex: rightIndex)
    }
}
