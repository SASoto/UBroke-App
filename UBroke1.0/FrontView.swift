//
//  FrontView.swift
//  UBroke1.0
//
//  Created by Sit Down on 7/31/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class FrontView: UIViewController {

    @IBAction func mvBack2Front(segue:UIStoryboardSegue) { }
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var metroButton: UIButton!
    
    @IBAction func profileButton(_ sender: Any) {
        performSegue(withIdentifier: "mv2ProfView", sender: nil)
    }
    
    let screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingsMenu()
        buttonStyles()
        metroButton.addTarget(self, action: #selector(self.metroButtonTap), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func settingsMenu() {
        if revealViewController() != nil {
            settingsButton.target = revealViewController()
            settingsButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = screenSize.width * 0.92
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
    }
    
    func metroButtonTap(sender: UIButton!) {
        performSegue(withIdentifier: "mv2MetroView", sender: nil)
    }
    
    func buttonStyles() {
        metroButton.layer.cornerRadius = 4.0
        //metroButton.layer.borderWidth = 1
        //metroButton.backgroundColor = UIColor(red: 171, green: 178, blue: 186, alpha: 1.0)
        // Shadow and Radius
        //Credit to @return true from Stack Overfloew
        metroButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        metroButton.layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        metroButton.layer.shadowOpacity = 0.8
        //metroButton.layer.shadowRadius = 0.0
        metroButton.layer.masksToBounds = false
        //metroButton.layer.cornerRadius = 4.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mv2ProfView") {
            
        }
        else if (segue.identifier == "mv2MetroView"){
            
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
