//
//  CurrentHoleViewController.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class CurrentHoleViewController: UIViewController {
    
    @IBOutlet var playerStrokesTextField: [UITextField]!
    @IBOutlet var playerNameLabel: [UILabel]!
    
    @IBOutlet weak var teeImage: UIImageView!
    @IBOutlet weak var holeNumber: UILabel!
    @IBOutlet weak var holePar: UILabel!
    @IBOutlet weak var holeDescription: UILabel!
    
    var course = rooseveltPark.holes
    var currentHole = rooseveltPark.currentHole
    var currentHoleIndex = rooseveltPark.currentHoleIndex
    
    var player = Player()
    var players = [Player]()
    var scoreTally = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayNamesAndFields()
        currentHoleIndex = 0
        reloadCurrentHole()
    }
    
    func displayNamesAndFields()    {
//        for i in 0..<Player.sharedPlayer.players.count {
//            playerNameLabel[i].hidden = false
//            playerNameLabel[i].text = Player.sharedPlayer.players[i]
//            playerStrokesTextField[i].hidden = false
//        }
        
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
    
    
    @IBAction func submitScoreButtonPressed(sender: AnyObject) {}
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CurrentHole<->Leaderboard" {
            let destVC = segue.destinationViewController as! LeaderboardViewController

//            if currentHoleIndex == 0    {
////                print("current hole index is ZERO")
//                for i in 0..<Player.sharedPlayer.players.count {
//                    let scoreToAdd = Int(playerStrokesTextField[i].text!)! - currentHole.par
//                    Player.sharedPlayer.scoreTally.append(scoreToAdd)
//                }
//            }   else    {
////                print("current hole index is \(currentHoleIndex)")
//                for i in 0..<Player.sharedPlayer.players.count {
//                    let scoreToAdd = Int(playerStrokesTextField[i].text!)! - currentHole.par
//                    print("Score to add:\(scoreToAdd)")
//                    Player.sharedPlayer.scoreTally[i] += scoreToAdd
//                    print(Player.sharedPlayer.scoreTally[i])
//                    
//                }
//            }
            if currentHoleIndex == 0    {
                for i in 0..<players.count  {
                    player.holeScore = Int(playerStrokesTextField[i].text!)! - currentHole.par
                }
            } else  {
                for i in 0..<players.count  {
                    player.holeScore = Int(playerStrokesTextField[i].text!)! - currentHole.par
                    player.cumulativeScore! += player.holeScore!
                }
            }
//            print("scoreTally array:\(Player.sharedPlayer.scoreTally)")
//            destVC.leaderboardResults = Player.sharedPlayer.scoreTally
            destVC.players = players
            destVC.currentHoleIndex = currentHoleIndex
        }
    }
    
    
    // Return from leaderboard
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
            currentHoleIndex++
    }
}