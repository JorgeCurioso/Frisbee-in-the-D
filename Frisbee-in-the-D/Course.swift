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
    
    let parkLattitude = 42.330456
    let parkLongitude = -83.077002
    
    var coursePar: Int {
        get {
            var sum = 0
            for hole in holes   {
                sum += hole.par
            }
            return sum
        }
    }
    
    init(name: String, description: String, holes: [Hole])  {
        self.name = name
        self.description = description
        self.holes = holes
    }
}

var rooseveltPark = Course(name: "Roosevelt Park", description: "Roosevelt Park starts and finishes with longer holes, but mainly has par threes. Pins are usually trees and phone poles, but some holes require a little more creativity with the disc. As always, be mindful of traffic and roads, especially since all streets and alleyways are considered out of bounds. Have fun!", holes: [hole1, hole2, hole3, hole4, hole5, hole6, hole7, hole8, hole9])


