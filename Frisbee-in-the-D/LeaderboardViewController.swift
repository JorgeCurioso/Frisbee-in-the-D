//
//  LeaderboardViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/2/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var finalResultsLabel: UILabel!
    @IBOutlet weak var nextHoleButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var leaderboardResults = String()
    var numberOfPlayers = ["player1"]
    var currentHoleIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        changeLayoutForFinalHole()
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPlayers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leaderboardCell", forIndexPath: indexPath)
        cell.textLabel!.text = leaderboardResults
        return cell
    }
}
