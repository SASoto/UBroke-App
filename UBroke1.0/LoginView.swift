//
//  LoginView.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/8/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.addTarget(self, action: #selector(self.loginButtonTap), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButtonTap() {
        performSegue(withIdentifier: "mv2QuestView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mv2QuestView") {
            if let vc = segue.destination as? QuestionnaireView {
                vc.passedUser = userField.text
                vc.passedPass = passField.text
            }
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
