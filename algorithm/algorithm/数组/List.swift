//
//  List.swift
//  algorithm
//
//  Created by 丘秀玉 on 2019/8/20.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

protocol List {
    associatedtype ItemType
    /// 长度
    func size() -> Int
    // 添加元素
    mutating func add(item: ItemType)
    mutating func add(index: Int, item: ItemType)
    // 移除元素
    mutating func remove(index: Int) -> ItemType
    // 清除所有
    mutating func clear()
    // 是否为空
    func isEmpty() -> Bool
    // 查询索引
    func indexOf(item: ItemType) -> Int

    // 是否包含
    func contains(item: ItemType) -> Bool

    // 获取index 位置元素
    mutating func get(index: Int) -> ItemType

    // 设置index位置元素
    mutating func set(index: Int, item: ItemType)
}
