//
//  LeaderboardViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/2/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit
import Parse

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var finalResultsLabel: UILabel!
    @IBOutlet weak var nextHoleButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var leaderboardResults = [Int]()
    var currentHoleIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        changeLayoutForFinalHole()
        saveFinalScores()
    }
    
    func changeLayoutForFinalHole() {
        finalResultsLabel.hidden = true
        newGameButton.hidden = true
        if currentHoleIndex == 8    {
            finalResultsLabel.hidden = false
            nextHoleButton.hidden = true
            newGameButton.hidden = false
        }
    }
    
    func saveFinalScores()  {
        
        
        if currentHoleIndex == 8    {
            for i in 0..<Player.sharedPlayer.players.count    {
                
                let player = PFObject(className: "Player")
                player.setObject(Player.sharedPlayer.players[i], forKey: "Name")
                player.setObject(Player.sharedPlayer.scoreTally[i], forKey: "Score")
                player.saveInBackgroundWithBlock { (succeeded, error) -> Void in
                    if succeeded {
                        print("\(player) Uploaded")
                    } else {
                        print("Error: \(error) \(error!.userInfo)")
                }
            }
        }
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Player.sharedPlayer.players.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("leaderboardCell", forIndexPath: indexPath)
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "leaderboardCell")

        cell.textLabel?.text = "\(leaderboardResults[indexPath.row])"
        cell.detailTextLabel?.text = Player.sharedPlayer.players[indexPath.row]
        return cell
    }
}
