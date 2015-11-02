//
//  CurrentHoleViewController.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class CurrentHoleViewController: UIViewController {
    
    
    @IBOutlet weak var userName1: UILabel!
    @IBOutlet weak var user1Strokes: UITextField!
    
    
    @IBOutlet weak var teeImage: UIImageView!
    @IBOutlet weak var holeNumber: UILabel!
    @IBOutlet weak var holePar: UILabel!
    @IBOutlet weak var holeDescription: UILabel!
    
    var course = rooseveltPark.holes
    var currentHole = Hole()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentHole = course[1]
        holeNumber.text = currentHole.name
        holePar.text = "\(currentHole.par)"
        holeDescription.text = currentHole.description
        teeImage.image = currentHole.firstPersonTeeImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitScoreButtonPressed(sender: AnyObject) {

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CurrentHole<->Leaderboard" {
            let destVC = segue.destinationViewController as! LeaderboardViewController
            // Pass the selected object to the new view controller
            currentHole.userStrokes = Int(user1Strokes.text!)
            destVC.leaderboardResults = "\(currentHole.userScore)"
            print("\(destVC.leaderboardResults)")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
