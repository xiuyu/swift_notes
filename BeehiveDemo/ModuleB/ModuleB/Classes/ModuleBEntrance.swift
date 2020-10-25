//
//  ModuleBEntrance.swift
//  ModuleA
//
//  Created by 丘秀玉 on 2020/9/20.
//

import BeeHive
import ModuleProtocol

public class ModuleBEntrance: NSObject, BHModuleProtocol {
    // 代替OC的+load方法
    public class func register() {
        BeeHive.registerDynamicModule(ModuleBEntrance.self)
        print("beehive register ModuleBEntrance")
    }

    public func modSetUp(_ context: BHContext!) {
        print("MuduleAEntrance setup")
    }

    public func modInit(_ context: BHContext!) {
        BeeHive.shareInstance()?.registerService(SendGiftProtocol.self,
                                                 service: SendGiftProtocolProvider.self)

        print("beehive ModuleBEntrance init")
    }
}
