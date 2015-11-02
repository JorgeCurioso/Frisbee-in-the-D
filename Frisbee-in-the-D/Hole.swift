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
    var aerialImage: UIImage?
    var firstPersonTeeImage: UIImage?
    
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
                aerialImage: nil,
                firstPersonTeeImage: nil,
                coordinates: nil)

let hole2 = Hole(name: "2",
                description: "The alleyway is out of bounds. Be careful as you go for the post!",
                par: 3,
                userStrokes: nil,
                aerialImage: nil,
                firstPersonTeeImage: nil,
                coordinates: nil)








