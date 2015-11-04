//
//  SetupGameViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/3/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class SetupGameViewController: UIViewController {

    @IBOutlet weak var player1NameField: UITextField!
    
//    var player1 = Player?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startRoundWithName(sender: AnyObject) {
//        player1!.name = player1NameField.text!
        Player.sharedPlayer.name = player1NameField.text!
    }

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "Start->TabBar" {
//            let destVC = segue.destinationViewController as! CurrentHoleViewController
//            // Pass the selected object to the new view controller
//            player1.name = player1NameField.text!
//            destVC.userName1.text = player1.name
//        }
//    }



}
