//
//  GetStartedViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/6/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    
    @IBOutlet weak var courseParLabel: UILabel!
    @IBOutlet weak var courseDescriptionTextView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseParLabel.text = "\(rooseveltPark.coursePar)"
        courseDescriptionTextView.text = rooseveltPark.description
    }
    
    
    @IBAction func highScoresButtonPressed(sender: AnyObject) {}
    
    @IBAction func newToGameButtonPressed(sender: AnyObject) {}
    
    @IBAction func getStartedButtonPressed(sender: AnyObject) {}
    
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {}
    

}
