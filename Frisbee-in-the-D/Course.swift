//
//  Course.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import Foundation


struct Course    {
    
    var name = String()
    var description = String()
    var holes = [Hole]()
    var currentHole = Hole()
    var currentHoleIndex = Int()
    var currentHoleScores = [Int]()
    var aggregateScores = [Int]()
    var scoreTally = Int()
    
    let parkLattitude = 42.330456
    let parkLongitude = -83.077002
    
    
    var coursePar: Int {
        get {
            var parArray = [Int]()
            for hole in holes   {
                parArray.append(hole.par)
            }
            return parArray.reduce(0, combine: +)
        }
    }
    
    init(name: String, holes: [Hole])  {
        self.name = name
        self.holes = holes
    }
}

var rooseveltPark = Course(name: "Roosevelt Park", holes: [hole1, hole2, hole3, hole4, hole5, hole6, hole7, hole8, hole9])


