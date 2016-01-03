//
//  ViewController.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/1/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = RefineSearchView()
        menu.view.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        menu.setData(["1","2","3","4"], waitTimeData: ["5","10"], travelCostData: ["$5","$10"], travelModeData: ["VW"])
        self.view.addSubview(menu.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //testView.picker.reloadAllComponents()
    }


}



