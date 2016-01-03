//
//  ViewController.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/1/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var searchRidesTextField: UITextField!
    
    @IBOutlet weak var ridersCountPicker: UIPickerView!
    @IBOutlet weak var waitTimePicker: UIPickerView!
    @IBOutlet weak var ridePricePicker: UIPickerView!
    @IBOutlet weak var rideSearchModePicker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setupView(){
        
        profileButton.layer.cornerRadius = 20
        profileButton.clipsToBounds = true
    }

}

