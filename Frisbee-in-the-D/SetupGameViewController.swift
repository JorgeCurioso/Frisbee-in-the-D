//
//  SetupGameViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit
import Parse

class SetupGameViewController: UIViewController {

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var playerNameTextField: [UITextField]!
    @IBOutlet weak var numberOfPlayers: UISegmentedControl!
    @IBOutlet var playerLabels: [UILabel]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startRoundWithName(sender: AnyObject) {
        
//        for i in 0..<playerNameTextField.count  {
//            if playerNameTextField[i].text == ""    {
//                playerNameTextField[i].placeholder = "Please add a name!"
//            } else  {
//                let player = Player(name: playerNameTextField[i].text!)
//                MultiPlayer.sharedMultiPlayer.players.append(player)
//                self.performSegueWithIdentifier("Start->Tab", sender: nil)
//            }
//        }
        
        if playerNameTextField[0].text == "" || playerNameTextField[1].text == ""
            || playerNameTextField[2].text == "" || playerNameTextField[3].text == ""   {
                for i in 0..<playerNameTextField.count  {
                    if playerNameTextField[i].text == ""    {
                        playerNameTextField[i].placeholder = "Please add a name!"
                    }
                }
        } else  {
            for i in 0..<playerNameTextField.count  {
                let player = Player(name: playerNameTextField[i].text!)
                MultiPlayer.sharedMultiPlayer.players.append(player)
                self.performSegueWithIdentifier("Start->Tab", sender: nil)
            }
        }
//        if playerNameTextField[0].text ==
        
//        for i in 0..<playerNameTextField.count    {
//            if playerNameTextField[i].text != ""   {
//                let player = Player(name: playerNameTextField[i].text!)
//                MultiPlayer.sharedMultiPlayer.players.append(player)
//                self.performSegueWithIdentifier("Start->Tab", sender: nil)
//            } 
//        }
//    
//        var namesArray = [String]()
//        for i in 0..<playerNameTextField.count   {
//            namesArray.append(playerNameTextField[i].text!)
//        }
//        print("namesArray: \(namesArray)")
//        // if the array has 0, go through and print a '?' for whoever has zero as their score
//        if namesArray.contains("")   {
//            for i in 0..<namesArray.count  {
//                if namesArray[i] == "" {playerNameTextField[i].text = "Please add a name"}
//            }
//            // otherwise, calculate everyones score, perform the segue, and reset the stepper values
//        } else  {
//            self.performSegueWithIdentifier("Start->Tab", sender: nil)
//        }
    }
    /*
    

*/


    @IBAction func numberOfPlayersChanged(sender: AnyObject) {
        displayPlayers()
    }
    
    func displayPlayers()   {
        
        switch numberOfPlayers.selectedSegmentIndex    {
        case 0:
            for i in 1...3  {
                playerLabels[i].hidden = true;
                playerNameTextField[i].hidden = true
            }
        case 1:
            for i in 0...1  {
                playerLabels[i].hidden = false;
                playerNameTextField[i].hidden = false
            }
            for i in 2...3  {
                playerLabels[i].hidden = true;
                playerNameTextField[i].hidden = true
            }
        case 2:
            for i in 0...2  {
                playerLabels[i].hidden = false;
                playerNameTextField[i].hidden = false
            }
                playerLabels[3].hidden = true;
                playerNameTextField[3].hidden = true
        case 3:
            for i in 0...3  {
                playerLabels[i].hidden = false;
                playerNameTextField[i].hidden = false
            }
        default:
            print("uh-oh, spaghetti-o's")
        }
    }
}
