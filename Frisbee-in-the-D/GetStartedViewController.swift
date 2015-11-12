//
//  GetStartedViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/6/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var courseParLabel: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        courseParLabel.text = "\(rooseveltPark.coursePar)"
        courseDescriptionLabel.text = rooseveltPark.description
    }
    
    @IBAction func newToGameButtonPressed(sender: AnyObject) {}
    
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {}
}
