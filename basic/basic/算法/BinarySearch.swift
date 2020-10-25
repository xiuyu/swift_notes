//
//  BinarySearch.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/21.
//

import Foundation

struct BinarySearch {
    func binarySearch(array: [Int], target: Int) -> Int {
        var left = 0
        var right = array.count - 1

        while left <= right {
            let mid = (right - left) / 2 + left

            if array[mid] == target {
                return mid
            } else if array[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return -1
    }

    /**
     有一个产品发布了n个版本。它遵循以下规律：假如某个版本崩溃了，后面的所有版本都会崩溃。
     举个例子：一个产品假如有5个版本，1，2，3版都是好的，但是第4版崩溃了，那么第5个版本（最新版本）一定也崩溃。第4版则被称为第一个崩溃的版本。
     现在已知一个产品有n个版本，而且有一个检测算法 func isBadVersion(version: Int) -> Bool 可以判断一个版本是否崩溃。假设这个产品的最新版本崩溃了，求第一个崩溃的版本。
     */
    func findFirstBadVersion(n: Int) -> Int {
        // 处理特殊情况
        guard n >= 1 else {
            return -1
        }

        var left = 1, right = n, mid = 0

        while left < right {
            mid = (right - left) / 2 + left
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left // return right 同样正确
    }

    func isBadVersion(_ mid: Int) -> Bool {
        return true
    }
}
