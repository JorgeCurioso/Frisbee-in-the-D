//
//  RulesViewController.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/2/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    
    @IBOutlet weak var rulesTextView: UITextView!
    
    let rules = Rules()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rulesTextView.text = "\(rules.rule1)\n\n\(rules.rule2)\n\n\(rules.rule3)\n\n\t\(rules.rule4)\n\n\(rules.rule5)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
