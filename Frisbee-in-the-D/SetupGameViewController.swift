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

    
    @IBOutlet var playerNameTextField: [UITextField]!
    @IBOutlet weak var numberOfPlayers: UISegmentedControl!
    @IBOutlet var playerLabels: [UILabel]!
    
    var player = Player.sharedPlayer
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startRoundWithName(sender: AnyObject) {
        
        for i in 0..<playerNameTextField.count    {
            if playerNameTextField[i].text != ""   {
                player.name = (playerNameTextField[i].text!)
                players.append(player)
                print("Inside: \(player.name!)")
                //First attempt at changing the code below to the code above. Getting away from Players collection in player class.
                
//            Player.sharedPlayer.players.append(playerNameTextField[playerToAdd].text!)
//            print("Inside: \(Player.sharedPlayer.players.description)")
            }
        }
            print(players.count)
    }


    @IBAction func numberOfPlayersChanged(sender: AnyObject) {
        
        displayPlayers()
  
    }
    
    func displayPlayers()   {
        
        switch numberOfPlayers.selectedSegmentIndex    {
        case 0:
//            playerLabels[0].hidden = false
            for i in 1...3  {playerLabels[i].hidden = true; playerNameTextField[i].hidden = true}
        case 1:
            for i in 0...1  {playerLabels[i].hidden = false; playerNameTextField[i].hidden = false}
            for i in 2...3  {playerLabels[i].hidden = true; playerNameTextField[i].hidden = true}
        case 2:
            for i in 0...2  {playerLabels[i].hidden = false; playerNameTextField[i].hidden = false}
            playerLabels[3].hidden = true; playerNameTextField[3].hidden = true
        case 3:
            for i in 0...3  {playerLabels[i].hidden = false; playerNameTextField[i].hidden = false}
        default:
            print("uh-oh, spaghetti-o's")
        }
        
    }
    
    /// hmm....seems there's some trouble trying to pass data to the TabBarController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Start->TabBar" {
            let destVC = segue.destinationViewController as! TabBarController
            destVC.players = players
        }
    }
}
