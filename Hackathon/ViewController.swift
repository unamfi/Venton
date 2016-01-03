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
        
        var testView = RefineSearchView()
        testView.view.frame = self.view.frame
        var label = UILabel(frame: CGRect(x: 30, y: 40, width: 300, height: 300))
        label.backgroundColor = UIColor.redColor()
        label.text = "Hola"
        testView.setData([label,label,label,label,label])
        
        self.view.addSubview(testView.view)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //testView.picker.reloadAllComponents()
    }


}



