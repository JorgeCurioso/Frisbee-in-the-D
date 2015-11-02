//
//  LeaderboardViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/2/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var leaderboardResults = String()
    var numberOfPlayers = ["player1"]
    var currentHole = Hole()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfPlayers.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leaderboardCell", forIndexPath: indexPath)
        cell.textLabel!.text = leaderboardResults
        print(leaderboardResults)
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
