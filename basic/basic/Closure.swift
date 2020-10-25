//
//  Closure.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/21.
//

import Foundation

struct Closure {
 
    typealias Task = ()->()
    
    var divide = {
        (val1: Int, val2: Int) -> Int in
        val1 / val2
    }
    
    func test()  {
        var car = "ben"
        
        let closure = {
            [car] in
            print("i drive \(car)")
        }
        
        car = "tes"
        
        closure()
    }
}
