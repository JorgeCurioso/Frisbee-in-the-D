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
//    var firstPersonTeeImage: UIImage?
    
    var coordinates: CLLocationCoordinate2D?
    
    var userScore: Int {
        get {
            return userStrokes! - par
        }
    }
}

let hole1 = Hole(name: "1",
                description: "You must go around the middle post before hitting the one on the right",
                par: 4,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole1")),
                coordinates: nil)

let hole2 = Hole(name: "2",
                description: "The alleyway is out of bounds. Be careful as you go for the post!",
                par: 3,
                userStrokes: nil,
                firstPersonTeeImage: (patternImage: UIImage(named: "Hole2")),
                coordinates: nil)





struct Course    {
    
    var name = String()
    var description = String()
    var holes = [Hole]()
    
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
    
    func startRound()   {
    }
}

let rooseveltPark = Course(name: "Roosevelt Park", holes: [hole1, hole2])








