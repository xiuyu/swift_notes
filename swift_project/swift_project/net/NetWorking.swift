//
//  NetWorking.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/8/9.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit
import Alamofire

class NetWorking: NSObject {
    
     func request()  {
        
        let parameters: Dictionary = ["foo": "bar"]
        
        let url = "https://httpbin.org/get"
        
        
        Alamofire.request(url, method: .get,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: nil).response { (response) in
                           
                            print(response)
        }
        
        
    }
    
    

}
