//
//  Player.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import Foundation

class Player {
    
    class var sharedPlayer : Player {
        struct Singleton {
            static let playerInstance = Player()
        }
        return Singleton.playerInstance;
    }
    
    var players = [String]()
    var score = [Int]()
    var scoreTally = [Int]()
    
}
