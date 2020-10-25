//
//  ModuleEntrance.swift
//  ModuleA
//
//  Created by 丘秀玉 on 2020/9/20.
//

import BeeHive
import ModuleProtocol

public class MuduleAEntrance: NSObject, BHModuleProtocol {
    // 代替OC的+load方法  动态加载
    public class func register() {
        BeeHive.registerDynamicModule(MuduleAEntrance.self)
        print("beehive register MuduleAEntrance")
    }
    
    public func modSetUp(_ context: BHContext!) {
        print("MuduleAEntrance setup")
    }
    public func modInit(_ context: BHContext!) {
        BeeHive.shareInstance()?.registerService(SeeSomeOneUserCardProtocol.self,
                                                 service: SeeSomeOneUserCardProtocolProvider.self)
   
        print("beehive MuduleAEntrance init");
        
 
    }
}
