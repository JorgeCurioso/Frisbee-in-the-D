//
//  Player.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import Foundation

class Player {
    
    var name: String?
    var holeScore = Int()
    var cumulativeScore = Int()
    
    init(name: String)  {
        self.name = name
    }
    
}

class MultiPlayer   {
    
    class var sharedMultiPlayer : MultiPlayer   {
        struct Singleton    {
            static let multiPlayerInstance = MultiPlayer()
        }
        return Singleton.multiPlayerInstance
    }
    
    var players = [Player]()
    
}
