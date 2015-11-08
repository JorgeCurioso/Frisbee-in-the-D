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
        // if we're on the last hole of the course, send all our players up to Parse with a name and score attribute
        if currentHoleIndex == 8    {
            for i in 0..<MultiPlayer.sharedMultiPlayer.players.count    {
                
                let player = PFObject(className: "Player")
                player.setObject(MultiPlayer.sharedMultiPlayer.players[i].name!, forKey: "Name")
                player.setObject(MultiPlayer.sharedMultiPlayer.players[i].cumulativeScore, forKey: "Score")
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

    // clears the collection of Players so none are added to another round
    @IBAction func newGameButtonPressed(sender: AnyObject) {
        MultiPlayer.sharedMultiPlayer.players = []
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MultiPlayer.sharedMultiPlayer.players.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "leaderboardCell")
        
        var players : [Player] = MultiPlayer.sharedMultiPlayer.players
        players.sortInPlace({ $0.cumulativeScore < $1.cumulativeScore })
        
        if players[indexPath.row].cumulativeScore > 0   {
            cell.detailTextLabel?.text = "+ \(players[indexPath.row].cumulativeScore)"
        } else if players[indexPath.row].cumulativeScore == 0 {
            cell.detailTextLabel?.text = "E"
        } else  {
            cell.detailTextLabel?.text = "\(players[indexPath.row].cumulativeScore)"
        }
        cell.textLabel?.text = players[indexPath.row].name
        return cell
    }
}
