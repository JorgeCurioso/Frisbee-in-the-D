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
    
    
    
//    var player1 = Player?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for field in playerNameTextField   {
            field.hidden = true
        }
        for label in playerLabels   {
            label.hidden = true
        }
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
        
        switch numberOfPlayers.selectedSegmentIndex {
        case 0:
            display1Player()
        case 1:
            display2Players()
        case 2:
            display3Players()
        case 3:
            display4Players()
        default:
            print("somethin went haywire")
        }
        
        
    }
    
    func displayPlayers()   {
        
        var selectedIndex = numberOfPlayers.selectedSegmentIndex
        
        switch selectedIndex    {
        case 0:
            
        }
        
    }
    
    func display1Player()   {
        playerLabels[0].hidden = false
        playerNameTextField[0].hidden = false
        
        playerLabels[1].hidden = true
        playerNameTextField[1].hidden = true
        playerLabels[2].hidden = true
        playerNameTextField[2].hidden = true
        playerLabels[3].hidden = true
        playerNameTextField[3].hidden = true
    }
    
    func display2Players()  {
        playerLabels[0].hidden = false
        playerNameTextField[0].hidden = false
        playerLabels[1].hidden = false
        playerNameTextField[1].hidden = false
        
        playerLabels[2].hidden = true
        playerNameTextField[2].hidden = true
        playerLabels[3].hidden = true
        playerNameTextField[3].hidden = true
    }
    
    func display3Players()  {
        playerLabels[0].hidden = false
        playerNameTextField[0].hidden = false
        playerLabels[1].hidden = false
        playerNameTextField[1].hidden = false
        playerLabels[2].hidden = false
        playerNameTextField[2].hidden = false
        
        playerLabels[3].hidden = true
        playerNameTextField[3].hidden = true
    }
    
    func display4Players()  {
        for field in playerNameTextField   {
            field.hidden = false
        }
        for label in playerLabels   {
            label.hidden = false
        }
    }
    
    


}
