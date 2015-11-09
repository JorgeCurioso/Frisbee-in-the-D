//
//  HighScoreTableViewCell.swift
//  Frisbee-in-the-D
//
//  Created by GLR on 11/8/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var highScoreCellName: UILabel!
    @IBOutlet weak var highScoreCellStrokes: UILabel!
    @IBOutlet weak var highScoreCellPar: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
