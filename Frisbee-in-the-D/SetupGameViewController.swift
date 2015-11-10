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
        
//        if playerNameTextField![0].text == "" || playerNameTextField![1].text == nil
//            || playerNameTextField![2].text == nil || playerNameTextField![3].text == nil   {
//                for i in 0..<playerNameTextField!.count  {
//                    if playerNameTextField![i].text == ""    {
//                        playerNameTextField![i].placeholder = "Please add a name!"
//                    }
//                }
//        } else  {
//            for i in 0..<playerNameTextField!.count  {
//                if playerNameTextField![i].hidden == false    {
//                let player = Player(name: playerNameTextField![i].text!)
//                MultiPlayer.sharedMultiPlayer.players.append(player)
//                self.performSegueWithIdentifier("Start->Tab", sender: nil)
//                }
//            }
//        }
        
//        switch  numberOfPlayers.selectedSegmentIndex {
//        case 0:
//            let player = Player(name: playerNameTextField[0].text!)
//            MultiPlayer.sharedMultiPlayer.players.append(player)
//        case 1:
//        case 2:
//        case 3:
//        }
        
//        for i in 0...numberOfPlayers.selectedSegmentIndex   {
//            print("segmentIndex:\(numberOfPlayers.selectedSegmentIndex)")
//            if playerNameTextField[i].text == ""   {
////                playerNameTextField[i].placeholder = "Please add a name!"
////                print("Empty Field:\(playerNameTextField[i].text)")
//                for eachField in playerNameTextField {
//                    if eachField.text == ""  {
//                        eachField.placeholder = "Please add a name!"
//                    }
//                }
//                return
//            } else  {
////                if playerNameTextField[i].text != ""    {
//                    let player = Player(name: playerNameTextField[i].text!)
//                    MultiPlayer.sharedMultiPlayer.players.append(player)
//                    print("Player Added:\(player.name)")
////                }
//            }
//        }
//                self.performSegueWithIdentifier("Start->Tab", sender: nil)
        
//        for field in playerNameTextField    {
//            var emptyFields: [String] = []
//            if field.text == "" {
//                emptyFields.append(field.text!)
//                print(emptyFields.count)
//            }
//            if emptyFields.isEmpty {
//                for name in playerNameTextField {
//                    let player = Player(name: name.text!)
//                    MultiPlayer.sharedMultiPlayer.players.append(player)
//                    print("Player Added:\(player.name)")
//                }
//                self.performSegueWithIdentifier("Start->Tab", sender: nil)
//   
//            }
//        }
        var names = [String]()

        
        for textField in playerNameTextField    {
            if textField.text != ""  {
                names.append(textField.text!)
                print("\(names)")
            }
        }
        
        if names.count == (numberOfPlayers.selectedSegmentIndex + 1){
            for eachName in playerNameTextField {
                if eachName.text != ""  {
                    let player = Player(name: eachName.text!)
                    MultiPlayer.sharedMultiPlayer.players.append(player)
                    print("Player Added:\(player.name)")
                }
            }
        self.performSegueWithIdentifier("Start->Tab", sender: nil)

        } else  {
            for eachField in playerNameTextField    {
                if eachField.text == "" {
                    eachField.placeholder = "Please enter a name"
                }
            }
        }
    }



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
