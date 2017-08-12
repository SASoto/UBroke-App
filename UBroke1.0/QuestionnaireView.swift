//
//  QuestionnaireView.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/9/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class QuestionnaireView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //var refresher: UIRefreshControl!
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        questTableView.frame = CGRect(x: questTableView.frame.origin.x, y: questTableView.frame.origin.y, width: questTableView.frame.size.width, height: questTableView.contentSize.height)
        //questTableView.reloadData()
        print(passedUser)
        print(passedPass)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hourlyButtonTap() {
        hourlyOrNot = true
        //DispatchQueue.main.async {
        self.questTableView.reloadData()
        //self.refresher.endRefreshing()
        //}
        //print("hourly")
    }
    
    func weeklyButtonTap() {
        hourlyOrNot = false
        //DispatchQueue.main.async {
        self.questTableView.reloadData()
        //self.refresher.endRefreshing()
        //}
        //print("weekly")
    }
    
    func submitButtonTap() {
        performSegue(withIdentifier: "mv2FrontView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(hourlyOrNot == nil) {
            //print("Always")
            return 1
        }
        else if(hourlyOrNot! == true) {
            print("Hourly")
            return questArray_H.count
        } else {
            print("Weekly")
            return questArray_W.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(hourlyOrNot == nil) {
            let cell = UITableViewCell()
            return cell
        } else if(hourlyOrNot! == true) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.questTextField?.delegate = self
            
            cell.questLabel.text = questArray_H[indexPath.row]

            //Credit to @CoffeeCoding from CoffeeCoding
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.questTextField?.autocorrectionType = UITextAutocorrectionType.no
            cell.questTextField?.autocapitalizationType = UITextAutocapitalizationType.none
            cell.questTextField?.adjustsFontSizeToFitWidth = true;
            //cell.questTextField.placeholder = tempNums[indexPath.row]
            cell.questTextField.tag = indexPath.row
            
            cell.alpha = 0
            UIView.animate(withDuration: 2, animations: { cell.alpha = 1 })
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.questTextField?.delegate = self
            
            cell.questLabel.text = questArray_W[indexPath.row]
            
            //Credit to @CoffeeCoding from CoffeeCoding
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.questTextField?.autocorrectionType = UITextAutocorrectionType.no
            cell.questTextField?.autocapitalizationType = UITextAutocapitalizationType.none
            cell.questTextField?.adjustsFontSizeToFitWidth = true;
            //cell.questTextField.placeholder = tempNums[indexPath.row]
            cell.questTextField.tag = indexPath.row
            
            cell.alpha = 0
            UIView.animate(withDuration: (2.5 * TimeInterval(indexPath.row)), animations: { cell.alpha = 1 })
            
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    var infoArray: [Double]! = []
    //Credit to @pbasdf from StackOverflow
    var rowBeingEdited : Int? = nil
    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = textField.tag
        print("Index: ", index)
        
        let newValue: Double? = Double(textField.text!)
        infoArray.insert(newValue!, at: index)
        rowBeingEdited = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        rowBeingEdited = textField.tag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mv2FrontView") {
            //print("hwat")
            //let revealVC = storyboard?.instantiateViewController(withIdentifier :"SWRevealViewController") as! SWRevealViewController
            let revealVC = segue.destination as! SWRevealViewController
            revealVC.loadView()
            let vc = revealVC.frontViewController as! UINavigationController
            vc.loadView()
            let mainVC = vc.topViewController as! FrontView
            //if let mainVC = vc.topViewController as? FrontView/*vc.topViewController?.isKind(of: FrontView))!*/ {
                print("hwat")
                //let mainVC = vc.topViewController as! FrontView
                mainVC.passedUser = passedUser
                mainVC.passedPass = passedPass
                mainVC.passedInfo = infoArray
            //}
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
