//
//  QuestionCell.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/5/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
    
    @IBOutlet weak var questLabel: UILabel!
    @IBOutlet weak var questTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
