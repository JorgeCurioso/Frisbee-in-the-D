//
//  Hole.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct Hole {
    
    var name = String()
    var description = String()
    var par = Int()
    var userStrokes: Int?
    var firstPersonTeeImage: UIImage?
    
    
    var teeLatitude: CLLocationDegrees?
    var teeLongitude: CLLocationDegrees?

//    var teeCoordinates: CLLocationCoordinate2D?
    
    var userScore: Int  {
        get {
            return userStrokes! - par
        }
    }
    
//    func calculateHoleScore(userStrokes: Int?, par: Int) -> Int {
//        
//            return userStrokes! - par
//    }
}


let hole1 = Hole(name: "1",
                description: "You must go around the middle post before hitting the one on the right",
                par: 4,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole1")),
                teeLatitude: 42.329880,
                teeLongitude: -83.074237)

let hole2 = Hole(name: "2",
                description: "The alleyway is out of bounds. Be careful as you go for the post!",
                par: 3,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole2")),
                teeLatitude: 42.329710,
                teeLongitude: -83.074835)

let hole3 = Hole(name: "3",
                description: "Aim for the big tree",
                par: 2,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole3")),
                teeLatitude: 42.329622,
                teeLongitude: -83.075698)

let hole4 = Hole(name: "4",
                description: "You must go around the middle post before hitting the one on the right",
                par: 4,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole4")),
                teeLatitude: 42.329784,
                teeLongitude: -83.076223)

let hole5 = Hole(name: "5",
                description: "The trick here is to LAND your frisbee on the tree stump. If it slides off it doesn't count.",
                par: 3,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole5")),
                teeLatitude: 42.330190,
                teeLongitude: -83.076476)

let hole6 = Hole(name: "6",
                description: "This one is equally tricky. Through the 'A', but only from the side you're currently facing (not the far side). Careful not to overshoot; It could cost you!",
                par: 3,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole6")),
                teeLatitude: 42.330094,
                teeLongitude: -83.077170)

let hole7 = Hole(name: "7",
                description: "Starting from at least 5 feet behind, you must go through the 'Roosevelt Park' gate before hitting the tree in view",
                par: 3,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole7")),
                teeLatitude:  42.330779,
                teeLongitude: -83.077247)

let hole8 = Hole(name: "8",
                description: "This hole is a little differet. There is a wall on the far side you must hit (anywhere is fine)",
                par: 3,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole8")),
                teeLatitude: 42.330910,
                teeLongitude:  -83.077724)

let hole9 = Hole(name: "9",
                description: "To complete this hole, you must go through the two central trees before hitting the distant tree on the right",
                par: 5,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole9")),
                teeLatitude:  42.330878,
                teeLongitude: -83.078460)





struct Course    {
    
    var name = String()
    var description = String()
    var holes = [Hole]()
    var currentHole = Hole()
    var currentHoleIndex = Int()
    var aggregateScores = [Int]()
    var scoreTally = Int()

    
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








