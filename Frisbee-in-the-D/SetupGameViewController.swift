//
//  SetupGameViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class SetupGameViewController: UIViewController {

    
    @IBOutlet var playerNameTextField: [UITextField]!
    @IBOutlet weak var numberOfPlayers: UISegmentedControl!
    @IBOutlet var playerLabels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startRoundWithName(sender: AnyObject) {

        for player in playerNameTextField  {
            
            if player.text != ""  {
                Player.sharedPlayer.players.append(playerNameTextField[numberOfPlayers.selectedSegmentIndex].text!)
            }
        }
        print("Seg Contrl Index:\(numberOfPlayers.selectedSegmentIndex)")
        print("collection of players:\(Player.sharedPlayer.players.count)")
    }


    @IBAction func numberOfPlayersChanged(sender: AnyObject) {
        
        displayPlayers()
  
    }
    
    func displayPlayers()   {
        
        switch numberOfPlayers.selectedSegmentIndex    {
        case 0:
            playerLabels[0].hidden = false
            for i in 1...3  {playerLabels[i].hidden = true; playerNameTextField[i].hidden = true}
        case 1:
            for i in 0...1  {playerLabels[i].hidden = false; playerNameTextField[i].hidden = false}
            for i in 2...3  {playerLabels[i].hidden = true; playerNameTextField[i].hidden = true}
        case 2:
            for i in 0...2  {playerLabels[i].hidden = false; playerNameTextField[i].hidden = false}
            playerLabels[3].hidden = true
        case 3:
            for i in 0...3  {playerLabels[i].hidden = false; playerNameTextField[i].hidden = false}
        default:
            print("uh-oh, spaghetti-o's")
        }
        
    }
}
