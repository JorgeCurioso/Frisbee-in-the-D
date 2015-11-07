//
//  HighScoresViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/6/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit
import Parse

class HighScoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var highScoresTableView: UITableView!
    
    var highScores = [Int]()
    var playerNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var query = PFQuery(className: "Player")
        query.orderByAscending("Score")
        query.findObjectsInBackgroundWithBlock  {
            (players:[PFObject]?, error:NSError?) -> Void in
            
            if error == nil {
                
                for player in players!   {
                    self.playerNames.append(player["Name"] as! (String))
                    self.highScores.append(player["Score"] as! (Int))
                }
                print(self.playerNames)
                print(self.highScores)
                
            } else  {
                print("NO SOUP FOR YOU!")
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        highScoresTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int   {
        return highScores.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
//        let cell = tableView.dequeueReusableCellWithIdentifier("HighScoreCell")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "HighScoreCell")
        
        cell.textLabel!.text = "\(highScores[indexPath.row])"
        cell.detailTextLabel!.text = playerNames[indexPath.row]
        return cell
    }
    
    @IBAction func test(sender: AnyObject) {
        highScoresTableView.reloadData()
    }

}
