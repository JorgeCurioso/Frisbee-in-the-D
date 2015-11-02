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
import MapKit

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







