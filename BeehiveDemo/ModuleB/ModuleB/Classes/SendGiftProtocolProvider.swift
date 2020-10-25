//
//  SendGiftProtocolProvider.swift
//  ModuleA
//
//  Created by 丘秀玉 on 2020/9/20.
//

import ModuleProtocol

class SendGiftProtocolProvider: NSObject, SendGiftProtocol {
    override init() {
        super.init()
        print("SendGiftProtocolProvider create")
    }
    
    func send() {
        print("send....")
    }
}
