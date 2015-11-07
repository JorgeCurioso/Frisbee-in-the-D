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
    
    var leaderboardResults = [String]()
    var currentHoleIndex: Int?
//    var players: [Player] = MultiPlayer.sharedMultiPlayer.players
    
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
//        if currentHoleIndex == 8    {
//            for i in 0..<players.count    {
//                
//                let player = PFObject(className: "Player")
//                player.setObject(players[i].name!, forKey: "Name")
//                player.setObject(players[i].cumulativeScore, forKey: "Score")
//                player.saveInBackgroundWithBlock { (succeeded, error) -> Void in
//                    if succeeded {
//                        print("\(player) Uploaded")
//                    } else {
//                        print("Error: \(error) \(error!.userInfo)")
//                    }
//                }
//            }
//        }
    }
    
//    func sortLeaderboard() -> [Player] {
//        for i in 0..<MultiPlayer.sharedMultiPlayer.players.count  {
//            
//        }
//    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MultiPlayer.sharedMultiPlayer.players.count
//        return players.count

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("leaderboardCell", forIndexPath: indexPath)
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "leaderboardCell")
        
        var players : [Player] = MultiPlayer.sharedMultiPlayer.players
        players.sortInPlace({ $0.cumulativeScore < $1.cumulativeScore })
        
        cell.textLabel?.text = "\(players[indexPath.row].cumulativeScore)"
        cell.detailTextLabel?.text = players[indexPath.row].name
//        cell.textLabel?.text = "\(players[indexPath.row].cumulativeScore)"
//        cell.detailTextLabel?.text = players[indexPath.row].name
        return cell
    }
}
