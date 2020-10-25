//
//  SeeSomeOneUserCardProtocolProvider.swift
//  ModuleA
//
//  Created by 丘秀玉 on 2020/9/20.
//

import ModuleProtocol

class SeeSomeOneUserCardProtocolProvider: NSObject, SeeSomeOneUserCardProtocol {
    
    
    override init() {
        super.init()
        print("SeeSomeOneUserCardProtocolProvider create")
    }
    
    
    func openUserCard(userId: Int64) {
        let vc = UserCardViewController(userId: userId)
        
        let rootVc = UIApplication.shared.keyWindow?.rootViewController
        rootVc?.present(vc, animated: true, completion: nil)
    }
    
    func see() {
        print("see...")
    }
    
    
   

}
