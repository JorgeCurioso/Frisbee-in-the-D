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
        
//        switch numberOfPlayers.selectedSegmentIndex {
//        case 0:
//            display1Player()
//        case 1:
//            display2Players()
//        case 2:
//            display3Players()
//        case 3:
//            display4Players()
//        default:
//            print("somethin went haywire")
//        }
        
        
    }
    
    func displayPlayers()   {
        
//        var selectedIndex = numberOfPlayers.selectedSegmentIndex
        
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
    
//    let a1 = ["a", "b", "c"]
//    let a2 = ["A", "B", "C"]
//    let a3 = [1, 2, 3]
//    
//    for i in 0 ..< a1.count {
//    println("\(a1[i])\(a2[i])\(a3[i])")
//    }
    
//    func display1Player()   {
//        playerLabels[0].hidden = false
//        playerNameTextField[0].hidden = false
//        
//        playerLabels[1].hidden = true
//        playerNameTextField[1].hidden = true
//        playerLabels[2].hidden = true
//        playerNameTextField[2].hidden = true
//        playerLabels[3].hidden = true
//        playerNameTextField[3].hidden = true
//    }
//    
//    func display2Players()  {
//        playerLabels[0].hidden = false
//        playerNameTextField[0].hidden = false
//        playerLabels[1].hidden = false
//        playerNameTextField[1].hidden = false
//        
//        playerLabels[2].hidden = true
//        playerNameTextField[2].hidden = true
//        playerLabels[3].hidden = true
//        playerNameTextField[3].hidden = true
//    }
//    
//    func display3Players()  {
//        playerLabels[0].hidden = false
//        playerNameTextField[0].hidden = false
//        playerLabels[1].hidden = false
//        playerNameTextField[1].hidden = false
//        playerLabels[2].hidden = false
//        playerNameTextField[2].hidden = false
//        
//        playerLabels[3].hidden = true
//        playerNameTextField[3].hidden = true
//    }
//    
//    func display4Players()  {
//        for field in playerNameTextField   {
//            field.hidden = false
//        }
//        for label in playerLabels   {
//            label.hidden = false
//        }
//    }
    
    


}
