//
//  QuestionnaireView.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/9/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class QuestionnaireView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var hourlyButton: UIButton!
    @IBOutlet weak var weeklyButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var questTableView: UITableView!
    
    var hourlyOrNot: Bool?
    var questArray_H: [String] = ["How much do you earn hourly?", "How many hours do you work in a week?"]
    var questArray_W: [String] = ["How much do you earn weekly?", "How many days do you work in a week?", "How many hours do you work in a day?"]
    var passedUser: String?
    var passedPass: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questTableView.delegate = self
        questTableView.dataSource = self
        questTableView.isScrollEnabled = false
        
        hourlyButton.addTarget(self, action: #selector(self.hourlyButtonTap), for: .touchUpInside)
        weeklyButton.addTarget(self, action: #selector(self.weeklyButtonTap), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(self.submitButtonTap), for: .touchUpInside)
        
        buttonStyles()
        
        questTableView.frame = CGRect(x: questTableView.frame.origin.x, y: questTableView.frame.origin.y, width: questTableView.frame.size.width, height: questTableView.contentSize.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonStyles() {
        hourlyButton.layer.cornerRadius = 4.0
        // Shadow and Radius
        //Credit to @return true from Stack Overflow
        hourlyButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        hourlyButton.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        hourlyButton.layer.shadowOpacity = 0.8
        hourlyButton.layer.masksToBounds = false
        
        weeklyButton.layer.cornerRadius = 4.0
        // Shadow and Radius
        //Credit to @return true from Stack Overflow
        weeklyButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        weeklyButton.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        weeklyButton.layer.shadowOpacity = 0.8
        weeklyButton.layer.masksToBounds = false
    }
    
    func hourlyButtonTap() {
        hourlyButton.isEnabled = false
        weeklyButton.isEnabled = true
        hourlyOrNot = true
        hourlyButton.backgroundColor = UIColor(red: 144/255.0, green: 174/255.0, blue: 190/255.0, alpha: 1.0)
        weeklyButton.backgroundColor = UIColor(red: 135/255.0, green: 219/255.0, blue: 220/255.0, alpha: 1.0)
        self.questTableView.reloadData()

        questTableView.frame = CGRect(x: questTableView.frame.origin.x, y: questTableView.frame.origin.y, width: questTableView.frame.size.width, height: questTableView.contentSize.height)
    }
    
    func weeklyButtonTap() {
        //Credit to @KerrM from StackOverflow
        weeklyButton.isEnabled = false
        hourlyButton.isEnabled = true
        hourlyOrNot = false
        weeklyButton.backgroundColor = UIColor(red: 144/255.0, green: 174/255.0, blue: 190/255.0, alpha: 1.0)
        hourlyButton.backgroundColor = UIColor(red: 135/255.0, green: 219/255.0, blue: 220/255.0, alpha: 1.0)
        self.questTableView.reloadData()
        
        questTableView.frame = CGRect(x: questTableView.frame.origin.x, y: questTableView.frame.origin.y, width: questTableView.frame.size.width, height: questTableView.contentSize.height)
    }
    
    func submitButtonTap() {
        performSegue(withIdentifier: "mv2FrontView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(hourlyOrNot == nil) {
            return 0
        }
        else if(hourlyOrNot! == true) {
            return questArray_H.count
        } else {
            return questArray_W.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(hourlyOrNot == nil) {
            let cell = UITableViewCell()
            return cell
        } else if(hourlyOrNot! == true) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.questTextField.delegate = self
            cell.questLabel.text = questArray_H[indexPath.row]
            cell.questLabel.textColor = .white
            
            //Credit to @CoffeeCoding from CoffeeCoding
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.questTextField.autocorrectionType = UITextAutocorrectionType.no
            cell.questTextField.autocapitalizationType = UITextAutocapitalizationType.none
            //cell.questTextField.adjustsFontSizeToFitWidth = true;
            cell.questTextField.tag = indexPath.row
            
            cell.alpha = 0
            UIView.animate(withDuration: (2 * TimeInterval(indexPath.row)), animations: { cell.alpha = 1 })
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.questTextField.delegate = self
            cell.questLabel.text = questArray_W[indexPath.row]
            cell.questLabel.textColor = .white
            
            //Credit to @CoffeeCoding from CoffeeCoding
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            //cell.questTextField.underlined()
            cell.questTextField.autocorrectionType = UITextAutocorrectionType.no
            cell.questTextField.autocapitalizationType = UITextAutocapitalizationType.none
            //cell.questTextField.adjustsFontSizeToFitWidth = true;
            cell.questTextField.tag = indexPath.row
            
            cell.alpha = 0
            UIView.animate(withDuration: (2 * TimeInterval(indexPath.row)), animations: { cell.alpha = 1 })
            
            return cell
        }
    }

    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.view.endEditing(true)
    }*/
    
    var infoArray: [Double]! = []
    //Credit to @pbasdf from StackOverflow
    var rowBeingEdited : Int?
    func textFieldDidBeginEditing(_ textField: UITextField) {
        rowBeingEdited = textField.tag
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = rowBeingEdited
        
        let newValue: Double? = Double(textField.text!)
        if(newValue != nil) {
            infoArray.insert(newValue!, at: index!)
        }
        
        rowBeingEdited = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mv2FrontView") {
            let revealVC = segue.destination as! SWRevealViewController
            revealVC.loadView()
            let vc = revealVC.frontViewController as! UINavigationController
            vc.loadView()
            let mainVC = vc.topViewController as! FrontView
                mainVC.passedUser = passedUser
                mainVC.passedPass = passedPass
                mainVC.passedInfo = infoArray
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
