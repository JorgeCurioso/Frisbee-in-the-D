//
//  LeaderboardTableViewCell.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/8/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellParLabel: UILabel!
    @IBOutlet weak var cellStrokesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
