//
//  SetupGameViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit
import Parse

class SetupGameViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var playerNameTextField: [UITextField]!
    @IBOutlet weak var numberOfPlayers: UISegmentedControl!
    @IBOutlet var playerLabels: [UILabel]!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        for field in playerNameTextField    {
            field.delegate = self
        }
    }

    @IBAction func startRoundWithName(sender: AnyObject) {
        checkForEmptyFields()
    }
    
    func checkForEmptyFields()  {
        var names = [String]()
        
        // If any fields are NOT empty, add them to the names array
        for textField in playerNameTextField    {
            if textField.text != ""  {
                names.append(textField.text!)
                print("\(names)")
            }
        }
        // if the number of names in the names array is the same as the number of user's selected (1 player...4 player),
        // instantiate Player objects with those names & segue to the start of the round
        if names.count == (numberOfPlayers.selectedSegmentIndex + 1){
            for eachName in playerNameTextField {
                if eachName.text != ""  {
                    let player = Player(name: eachName.text!)
                    MultiPlayer.sharedMultiPlayer.players.append(player)
                    print("Player Added:\(player.name)")
                }
            }
            self.performSegueWithIdentifier("Start->Tab", sender: nil)
            
        // Otherwise, change the placeholder text of the empty fields
        } else  {
            for eachField in playerNameTextField    {
                if eachField.text == "" {
                    eachField.placeholder = "Please enter a name"
                }
            }
        }
    }
    
    // functions to remove keyboard when either pressing return or tapping off the screen
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        for field in playerNameTextField    {
            field.resignFirstResponder()
        }
        return true;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for field in playerNameTextField    {
            field.resignFirstResponder()
            self.view.endEditing(true)
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
