//
//  Ericsson.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/2/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import Alamofire

class EricssonManager {
    
    let parameters = ["username" : "provider", "pin": "1234", "vin" : "3152177573"]
    
    func logIn() {
        ASDPRequestManager.sharedManager().login(parameters) { (asdpResult) -> Void in
        }
    }
    
    
}