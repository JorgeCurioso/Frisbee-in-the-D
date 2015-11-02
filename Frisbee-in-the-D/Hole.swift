//
//  Hole.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import Foundation
import UIKit

class Hole {
    
    var title = String()
    var description = String()
    var par = Int()
    var userStrokes: Int?
    var aerialImage: UIImage?
    var firstPersonTeeImage: UIImage?
    
    var userScore: Int {
        get {
            return userStrokes! - par
        }
    }
    
    init(title: String) {
        self.title = title
    }
    
}

let hole1 = Hole(title: "Hole #1")
let hole2 = Hole(title: "Hole #2")

