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
    
//    var players: [Player] = MultiPlayer.sharedMultiPlayer.players
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayNamesAndFields()
        currentHoleIndex = 0
        reloadCurrentHole()
        print("Current Hole has \(MultiPlayer.sharedMultiPlayer.players.count) players")
//        print("Current Hole has \(players.count) players")

    }
    
    func displayNamesAndFields()    {

        for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
            playerNameLabel[i].hidden = false
            playerNameLabel[i].text = MultiPlayer.sharedMultiPlayer.players[i].name
            playerStrokesTextField[i].hidden = false
        }
//        for i in 0..<players.count  {
//            playerNameLabel[i].hidden = false
//            playerNameLabel[i].text = players[i].name
//            playerStrokesTextField[i].hidden = false
//        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        print("Current Hole:\(currentHoleIndex + 1)")
        reloadCurrentHole()
        for i in 0..<MultiPlayer.sharedMultiPlayer.players.count    {
            print(MultiPlayer.sharedMultiPlayer.players[i].holeScore)
        }
//        for i in 0..<players.count    {
//            print(players[i].holeScore)
//        }
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

                for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
                    print(MultiPlayer.sharedMultiPlayer.players[i].name)
                    MultiPlayer.sharedMultiPlayer.players[i].holeScore = Int(playerStrokesTextField[i].text!)! - currentHole.par
                    MultiPlayer.sharedMultiPlayer.players[i].cumulativeScore += MultiPlayer.sharedMultiPlayer.players[i].holeScore
                }
//            for i in 0..<players.count  {
//                print(players[i].name)
//                players[i].holeScore = Int(playerStrokesTextField[i].text!)! - currentHole.par
//                players[i].cumulativeScore += players[i].holeScore
//            }
            
            destVC.currentHoleIndex = currentHoleIndex
        }
    }
    
    
    // Return from leaderboard
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
            currentHoleIndex++
    }
}