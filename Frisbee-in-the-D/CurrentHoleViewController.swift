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
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var eachItemOnPage: UIView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var teeImage: UIImageView!
    @IBOutlet weak var holeNumber: UILabel!
    @IBOutlet weak var holePar: UILabel!
    @IBOutlet weak var holeDescription: UILabel!
    
    @IBOutlet weak var imageBorder: UIView!
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var parLabel: UILabel!
    
    
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
        print("Current hole = \(currentHoleIndex + 1)")
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations:{
            self.eachItemOnPage.alpha = 1.0}, completion: nil)
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
    
    func checkForNonEnteredScores() {
        
        // go through steppers and add each's value to an array
        var incrementerValuesArray = [Int]()
        for i in 0..<MultiPlayer.sharedMultiPlayer.players.count   {
            incrementerValuesArray.append(Int(strokeIncrementers[i].value))
        }
        print("incrementerValuesArray = \(incrementerValuesArray)")
        // if the array has 0, go through and print a '?' for whoever has zero as their score
        if incrementerValuesArray.contains(0)   {
            for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
                if strokeIncrementers[i].value == 0 {playerStrokesLabel[i].text = "?"}
            }
            // otherwise, calculate everyones score, perform the segue, and reset the stepper values
        } else  {
            calculateScores()
            self.performSegueWithIdentifier("Current<->Leaderboard", sender: nil)
            resetStepperValues()
        }
    }
    
    
    //To be called when moving on to the next hole
    func resetStepperValues()   {
        for textField in playerStrokesLabel  {textField.text = "0"}
        for stepper in strokeIncrementers   {stepper.value = 0}
    }
    
    //Take whatever current players we have and get a current score for this hole. Then, do 2 types of math, one with all strokes and another with a cumulative par
    func calculateScores()  {
        for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
            MultiPlayer.sharedMultiPlayer.players[i].holeScore = Int(playerStrokesLabel[i].text!)! - currentHole.par
            MultiPlayer.sharedMultiPlayer.players[i].cumulativeScore += MultiPlayer.sharedMultiPlayer.players[i].holeScore
            MultiPlayer.sharedMultiPlayer.players[i].cumulativeStrokes += Int(playerStrokesLabel[i].text!)!
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Current<->Leaderboard" {
            let destVC = segue.destinationViewController as! LeaderboardViewController
            destVC.currentHoleIndex = currentHoleIndex
        }
    }

    
    @IBAction func strokeIncrementerTapped(sender: AnyObject) {
        for i in 0..<strokeIncrementers.count   {
            playerStrokesLabel[i].text = "\(Int(strokeIncrementers[i].value))"
        }
    }
    
    @IBAction func submitScoreButtonPressed(sender: AnyObject) {
        checkForNonEnteredScores()
    }
    
    // Return from leaderboard and go to next hole in the array
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
            currentHoleIndex++
            self.eachItemOnPage.alpha = 0.0
    }
}