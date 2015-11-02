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

class Hole {
    
    var name = String()
    var description = String()
    var par = Int()
    var userStrokes: Int?
    var aerialImage: UIImage?
    var firstPersonTeeImage: UIImage?
    
    var coordinates = CLLocationCoordinate2D()
    
    var userScore: Int {
        get {
            return userStrokes! - par
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
}

let hole1 = Hole(name: "Hole #1")
let hole2 = Hole(name: "Hole #2")
let hole3 = Hole(name: "Hole #3")
let hole4 = Hole(name: "Hole #4")
let hole5 = Hole(name: "Hole #5")
let hole6 = Hole(name: "Hole #6")
let hole7 = Hole(name: "Hole #7")
let hole8 = Hole(name: "Hole #8")
let hole9 = Hole(name: "Hole #9")







