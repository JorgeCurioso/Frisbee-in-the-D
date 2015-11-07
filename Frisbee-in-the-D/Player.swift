//
//  Player.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import Foundation

class Player {
    
//    class var sharedPlayer : Player {
//        struct Singleton {
//            static let playerInstance = Player()
//        }
//        return Singleton.playerInstance;
//    }
    
    var name: String?
    var holeScore = Int()
    var cumulativeScore = Int()
    
    //consider messing with this-we only need a collection of players in certain circumstances
    //A player could be created, their score added to, and that be contained in a different collection of player objects. Then, they would be able to be moved around by sorting them by their scores (this would have an effect on the leaderboard, not the high scores board (where we're pulling and sorting from Parse after the player and the score have been married together)). This gets at the same thing, only trying to marry the two stats earlier instead of when it finally gets sent to Parse.
//    var players = [String]()
    
    //Same idea with score, though that could be used to accumulate a collection of scores per hole (to add in the end) maybe? Right now I'm using this like an array of scores for multi-users, which each add to scoreTally every round. It seems like this can be done a better way. Each 'Player' should be instantiated when the game is started. This player should have a name property, a score property, and a cumulative score property. Then I can show their cumulative scores, their par scores, and create an [Player] in whatever VC I want to pass those players along to. Eventually, I can submit them with their scores and names the same way. 
    //Pulling data back down from Parse doesn't seem like it will change at all. I could still manipulate the data the way I want to with the high scores (minus this async business). This is wanting to have closely related data before Parse instead of just after.
//    var score = [Int]()
//    var scoreTally = [Int]()
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
