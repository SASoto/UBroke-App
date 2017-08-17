//
//  Extensions.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/16/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import Foundation

extension UITextField {
    
    func lineforQuestView(){
        //Credit to @Ashish Kakkad from StackOverflow
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
        self.textAlignment = .center
    }
    
    func lineforMetroView(){
        //Credit to @Ashish Kakkad from StackOverflow
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor(red: 126/255.0, green: 146/255.0, blue: 212/255.0, alpha: 1.0).cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
        self.textAlignment = .center
    }
}
