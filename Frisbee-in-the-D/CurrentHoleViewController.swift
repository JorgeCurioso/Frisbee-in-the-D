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
    
    @IBOutlet var playerStrokesTextField: [UITextField]!
    @IBOutlet var playerNameLabel: [UILabel]!
    
    @IBOutlet weak var teeImage: UIImageView!
    @IBOutlet weak var holeNumber: UILabel!
    @IBOutlet weak var holePar: UILabel!
    @IBOutlet weak var holeDescription: UILabel!
    
    var course = rooseveltPark.holes
    var currentHole = rooseveltPark.currentHole
    var currentHoleIndex = rooseveltPark.currentHoleIndex
//    var scoreTally = rooseveltPark.scoreTally
//    var scoreTally = Player.sharedPlayer.scoreTally
    var scoreTally = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        userName1.text = "\(Player.sharedPlayer.players[0])'s score"
        displayNamesAndFields()
        currentHoleIndex = 0
        reloadCurrentHole()
    }
    
    func displayNamesAndFields()    {
        for playerToDisplay in 0..<Player.sharedPlayer.players.count {
            playerNameLabel[playerToDisplay].hidden = false
            playerNameLabel[playerToDisplay].text = Player.sharedPlayer.players[playerToDisplay]
            playerStrokesTextField[playerToDisplay].hidden = false
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        print("Current Hole:\(currentHoleIndex + 1)")
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
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitScoreButtonPressed(sender: AnyObject) {
        

    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CurrentHole<->Leaderboard" {
            let destVC = segue.destinationViewController as! LeaderboardViewController

            // Pass the selected object to the new view controller
//            currentHole.userStrokes = Int(user1Strokes.text!)
//            var scoreToAdd = currentHole.userScore
//            scoreTally += scoreToAdd
//            var scoreArray = [Int]()
//            for i in 0..<Player.sharedPlayer.players.count  {
//                
//                scoreArray
//            }
            if currentHoleIndex == 0    {
                print("current hole index is ZERO")
                for i in 0..<Player.sharedPlayer.players.count {
                    //            Player.sharedPlayer.score.append(Int(playerStrokesTextField[i].text!)!)
                    //            print(Player.sharedPlayer.score[i])
                    let scoreToAdd = Int(playerStrokesTextField[i].text!)
                    scoreTally.append(scoreToAdd!)
                }
            }   else    {
                print("current hole index is \(currentHoleIndex)")
                for i in 0..<Player.sharedPlayer.players.count {
                    //                let currentHoleScore = Int(playerStrokesTextField[i].text!)
                    //                for n in
                    scoreTally[i] += Int(playerStrokesTextField[i].text!)!
                    
                }
            }
            print(scoreTally)
            
            print("Par:\(currentHole.par), user:\(user1Strokes.text!), Aggregate:\(scoreTally)")
            
            destVC.leaderboardResults = "\(scoreTally)"
            destVC.currentHoleIndex = currentHoleIndex
//            print("Leaderboard Results:\(destVC.leaderboardResults)")
        }
    }
    
    
    // Return from leaderboard
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
            currentHoleIndex++
    }
}