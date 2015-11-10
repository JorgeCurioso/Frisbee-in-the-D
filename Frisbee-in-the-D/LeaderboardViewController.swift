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
    
    @IBOutlet weak var eachItemOnPage: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var finalResultsLabel: UILabel!
    @IBOutlet weak var nextHoleButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var leaderboardLabel: UILabel!
    
    var currentHoleIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeLayoutForFinalHole() {
        newGameButton.hidden = true
        if currentHoleIndex == 8    {
            nextHoleButton.hidden = true
            newGameButton.hidden = false
            leaderboardLabel.text = "Final Results"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if currentHoleIndex == 8    {
            changeLayoutForFinalHole()
            saveFinalScores()
        }
        self.eachItemOnPage.alpha = 0.0
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations:{
        self.eachItemOnPage.alpha = 0.0}, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations:{
        self.eachItemOnPage.alpha = 1.0}, completion: nil)
    }
    
    func saveFinalScores()  {
        // if we're on the last hole of the course, send all our players up to Parse with a name and score attribute
        if currentHoleIndex == 8    {
            for i in 0..<MultiPlayer.sharedMultiPlayer.players.count    {
                
                let player = PFObject(className: "Player")
                player.setObject(MultiPlayer.sharedMultiPlayer.players[i].name!, forKey: "Name")
                player.setObject(MultiPlayer.sharedMultiPlayer.players[i].cumulativeStrokes, forKey: "Score")
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
        let cell:LeaderboardTableViewCell = tableView.dequeueReusableCellWithIdentifier("leaderboardCell", forIndexPath: indexPath) as! LeaderboardTableViewCell
        
        var players : [Player] = MultiPlayer.sharedMultiPlayer.players
        players.sortInPlace({ $0.cumulativeScore < $1.cumulativeScore })
        
        if players[indexPath.row].cumulativeScore > 0   {
            cell.cellParLabel.text = "+ \(players[indexPath.row].cumulativeScore)"
        } else if players[indexPath.row].cumulativeScore == 0 {
            cell.cellParLabel.text = "E"
            cell.cellParLabel.textColor = UIColor.greenColor()
            cell.cellStrokesLabel.textColor = UIColor.greenColor()
        } else  {
            cell.cellParLabel.text = "\(players[indexPath.row].cumulativeScore)"
            cell.cellParLabel.textColor = UIColor.redColor()
            cell.cellStrokesLabel.textColor = UIColor.redColor()
        }
        cell.cellNameLabel.text = players[indexPath.row].name
        cell.cellStrokesLabel.text = "\(players[indexPath.row].cumulativeStrokes)"
        return cell
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "Leaderboard->Current" {
//            let destVC = segue.destinationViewController as! CurrentHoleViewController
//            destVC.currentHoleIndex = currentHoleIndex!++
//            destVC.eachItemOnPage.alpha = 0.0
//        }
//    }
}
