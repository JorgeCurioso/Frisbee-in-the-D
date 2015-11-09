//
//  CurrentHoleViewController.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class CurrentHoleViewController: UIViewController {
    
    
    @IBOutlet var playerStrokesLabel: [UILabel]!
    @IBOutlet var playerNameLabel: [UILabel]!
    @IBOutlet var strokeIncrementers: [UIStepper]!
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var teeImage: UIImageView!
    @IBOutlet weak var holeNumber: UILabel!
    @IBOutlet weak var holePar: UILabel!
    @IBOutlet weak var holeDescription: UILabel!
    
    var course = rooseveltPark.holes
    var currentHole = rooseveltPark.currentHole
    var currentHoleIndex = rooseveltPark.currentHoleIndex
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayNamesAndFields()
        currentHoleIndex = 0
        reloadCurrentHole()
    }
    
    func displayNamesAndFields()    {
        for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
            playerNameLabel[i].hidden = false
            playerNameLabel[i].text = MultiPlayer.sharedMultiPlayer.players[i].name
            playerStrokesLabel[i].hidden = false
            strokeIncrementers[i].hidden = false
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        reloadCurrentHole()
    }
    
    func reloadCurrentHole()   {
        currentHole = course[currentHoleIndex]
        holeNumber.text = currentHole.name
        holePar.text = "\(currentHole.par)"
        holeDescription.text = currentHole.description
        teeImage.image = currentHole.firstPersonTeeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func strokeIncrementerTapped(sender: AnyObject) {
        for i in 0..<strokeIncrementers.count   {
            playerStrokesLabel[i].text = "\(Int(strokeIncrementers[i].value))"
        }
    }
    
    @IBAction func submitScoreButtonPressed(sender: AnyObject) {
        for textField in playerStrokesLabel  {
            textField.text = ""
        }
        for stepper in strokeIncrementers   {
            stepper.value = 0
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CurrentHole<->Leaderboard" {
            let destVC = segue.destinationViewController as! LeaderboardViewController

                for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
                    MultiPlayer.sharedMultiPlayer.players[i].holeScore = Int(playerStrokesLabel[i].text!)! - currentHole.par
                    MultiPlayer.sharedMultiPlayer.players[i].cumulativeScore += MultiPlayer.sharedMultiPlayer.players[i].holeScore
                    MultiPlayer.sharedMultiPlayer.players[i].cumulativeStrokes += Int(playerStrokesLabel[i].text!)!
                }
            
            destVC.currentHoleIndex = currentHoleIndex
        }
    }
    
    
    // Return from leaderboard and go to next hole in the array
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
            currentHoleIndex++
    }
}