//
//  InfoCell.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/9/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

/*extension UITextField {
    
    func underlined(){
        //Credit to @Ashish Kakkad from StackOverflow
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
        self.textAlignment = .center
    }
}*/

class InfoCell: UITableViewCell {

    @IBOutlet weak var questLabel: UILabel!
    @IBOutlet weak var questTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        questTextField.lineforQuestView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
