//
//  Music.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/24.
//

import Foundation

struct Music {
    let name:String
    let singer:String
    init(name:String,singer:String) {
        self.name = name
        self.singer = singer
    }
}

extension Music : CustomStringConvertible {
    var description: String{
        return "name:\(name) singer:\(singer)"
    }
}
