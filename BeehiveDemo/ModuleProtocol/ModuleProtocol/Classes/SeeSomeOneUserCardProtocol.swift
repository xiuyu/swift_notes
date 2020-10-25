//
//  SeeSomeOneUserCardProtocol.swift
//  ModuleProtocol
//
//  Created by 丘秀玉 on 2020/9/20.
//

import BeeHive

@objc public protocol SeeSomeOneUserCardProtocol: BHServiceProtocol {
    /// 打开某个用户资料卡
    func openUserCard(userId: Int64)
    
    func see()
}
