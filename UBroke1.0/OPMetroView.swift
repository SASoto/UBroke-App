//
//  OPMetroView.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/6/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class OPMetroView: UIViewController {

    @IBAction func closeButton(_ sender: Any) {
        //performSegue(withIdentifier: "mvBack2FrontSeg", sender: self)
          dismiss(animated: true, completion: nil)
    }
    var passedValArr: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
