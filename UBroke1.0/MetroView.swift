//
//  MetroView.swift
//  UBroke1.0
//
//  Created by Sit Down on 7/31/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class MetroView: UIViewController {
    
    //Credit to Luna An from Medium
    @IBAction func closeButton(_ sender: Any) {
        performSegue(withIdentifier: "mvBack2FrontSeg", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //CAN USE
        //myFirstButton.addTarget(self, action: #selector(myClass.pressed(_:)), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Credit to @Yerbol from Stack Overflow
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
