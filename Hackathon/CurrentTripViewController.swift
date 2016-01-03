//
//  CurrentTripViewController.swift
//  Hackathon
//
//  Created by Jonathan Velazquez on 03/01/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class CurrentTripViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   

}
