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
    var currentHoleIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentHoleIndex = 0
        currentHole = course[currentHoleIndex]
        holeNumber.text = currentHole.name
        holePar.text = "\(currentHole.par)"
        holeDescription.text = currentHole.description
        teeImage.image = currentHole.firstPersonTeeImage
    }
    
    
    override func viewWillAppear(animated: Bool) {
        print("Current Hole:\(currentHoleIndex)")
        currentHole = course[currentHoleIndex]
        holeNumber.text = currentHole.name
        holePar.text = "\(currentHole.par)"
        holeDescription.text = currentHole.description
        teeImage.image = currentHole.firstPersonTeeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitScoreButtonPressed(sender: AnyObject) {}
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CurrentHole<->Leaderboard" {
            let destVC = segue.destinationViewController as! LeaderboardViewController
            // Pass the selected object to the new view controller
            currentHole.userStrokes = Int(user1Strokes.text!)
            destVC.leaderboardResults = "\(currentHole.userScore)"
            print("Leaderboard Results:\(destVC.leaderboardResults)")
        }
    }
    
    
    // Return from leaderboard
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
        currentHoleIndex++
        
    }
}
