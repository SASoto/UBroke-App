//
//  MetroView.swift
//  UBroke1.0
//
//  Created by Sit Down on 7/31/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

extension UILabel
{
    //Credit to @Philipp Otto from StackOverflow
    var optimalHeight : CGFloat
    {
        get
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = self.lineBreakMode
            label.font = self.font
            label.text = self.text
            
            label.sizeToFit()
            
            return label.frame.height
        }
    }
}

class MetroView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Credit to @Luna An from Medium
    @IBAction func closeButton(_ sender: Any) {
        performSegue(withIdentifier: "mvBack2FrontSeg", sender: self)
    }
    
    @IBOutlet weak var questTableView: UITableView!
    
     var questArray: [String] = ["How many bus/train trips do you make in a day?", "How many (if any) of these trips are covered by ride transfers?", "For how many days of the week do you travel this often?", "How many of these trips are express bus service trips?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //CAN USE
        //myFirstButton.addTarget(self, action: #selector(myClass.pressed(_:)), forControlEvents: .TouchUpInside)
        
        questTableView.delegate = self
        questTableView.dataSource = self
        questTableView.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        questTableView.frame = CGRect(x: questTableView.frame.origin.x, y: questTableView.frame.origin.y, width: questTableView.frame.size.width, height: questTableView.contentSize.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Credit to @Yerbol from Stack Overflow
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var customHeight: CGFloat?
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customHeight!
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "questionCell",
            for: indexPath) as! QuestionCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.questLabel.text = questArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
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
