//
//  QuestionnaireView.swift
//  UBroke1.0
//
//  Created by Sit Down on 8/9/17.
//  Copyright © 2017 Sit Down and Enjoy. All rights reserved.
//

import UIKit

class QuestionnaireView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var questTableView: UITableView!
    
    var passedUser: String?
    var passedPass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questTableView.delegate = self
        questTableView.dataSource = self
        questTableView.isScrollEnabled = false
        
        submitButton.addTarget(self, action: #selector(self.submitButtonTap), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        questTableView.frame = CGRect(x: questTableView.frame.origin.x, y: questTableView.frame.origin.y, width: questTableView.frame.size.width, height: questTableView.contentSize.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func submitButtonTap() {
        performSegue(withIdentifier: "mv2FrontView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
        return cell
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
