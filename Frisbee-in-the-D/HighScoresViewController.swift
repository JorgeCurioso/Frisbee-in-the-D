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
                    self.highScoresTableView.reloadData()
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
//        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "HighScoreCell")
        let cell: HighScoreTableViewCell = tableView.dequeueReusableCellWithIdentifier("HighScoreCell", forIndexPath: indexPath) as! HighScoreTableViewCell
        
        if Int(highScores[indexPath.row].value) > rooseveltPark.coursePar   {
            cell.highScoreCellPar.text = "+ \(highScores[indexPath.row] - rooseveltPark.coursePar)"
        } else if Int(highScores[indexPath.row].value) == rooseveltPark.coursePar {
            cell.highScoreCellPar.text = "E"
            cell.highScoreCellPar.textColor = UIColor.greenColor()
            cell.highScoreCellStrokes?.textColor = UIColor.greenColor()
        } else  {
            cell.highScoreCellPar.text = "\((highScores[indexPath.row] - rooseveltPark.coursePar))"
            cell.highScoreCellPar.textColor = UIColor.redColor()
            cell.highScoreCellStrokes.textColor = UIColor.redColor()
        }
        cell.highScoreCellName.text = playerNames[indexPath.row]
        cell.highScoreCellStrokes.text = "\(highScores[indexPath.row])"

        return cell
    }
}
