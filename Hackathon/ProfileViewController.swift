//
//  ProfileViewController.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/3/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import UIKit



class tableDataSource: NSObject,UITableViewDataSource {
    var descriptionTexts = [String]()
    var valuesTexts = [String]()
    var valueColors = [UIColor]()
    var tableView:UITableView!
    
    
    init(descriptionTexts:[String],valuesTexts:[String],valueColors:[UIColor],tableView:UITableView) {
        self.descriptionTexts = descriptionTexts
        self.valuesTexts = valuesTexts
        self.valueColors = valueColors
        self.tableView = tableView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptionTexts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell") as! ProfileCell
        cell.setCell(descriptionTexts[indexPath.row], value: valuesTexts[indexPath.row], valueColor: valueColors[indexPath.row])
        return cell
    }
}




class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var stateTableView: UITableView!
    
    var ericssonManager = EricssonManager()
    var isLogged:Bool = false
    var descriptionState = [String]()
    var valueState = [String]()
    var valueColor = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login()
        configTable()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        getDiagnosticInfo()
    }
    
    func login(){
        ericssonManager.logIn {
            (success) -> () in
            if success {
               self.isLogged = true
                    
            }else{
                self.isLogged = false
            }
        }

    }
    
    
    func configTable(){
        stateTableView.dataSource = tableDataSource(descriptionTexts: descriptionState, valuesTexts: valueState, valueColors: valueColor, tableView: stateTableView)
    }
    
    
    
    
    func getDiagnosticInfo(){
            ericssonManager.getDiagnosticDataStatus{
                (info)->() in
                var statusReport = info["statusReport"] as! NSDictionary
                for (key,value) in statusReport {
                    
                    switch key as! String {
                        case "abs":
                            self.descriptionState.append("ABS")
                            
                            if value as! String == "OK"{
                                self.valueState.append("Looks Good")
                                self.valueColor.append(UIColor.greenColor())
                            }else{
                                self.valueState.append("Danger")
                                self.valueColor.append(UIColor.redColor())
                            }
                            break;
                        case "airbags":
                            self.descriptionState.append("AirBags")
                            if value as! String == "OK"{
                                self.valueState.append("Looks Good")
                                self.valueColor.append(UIColor.greenColor())
                            }else{
                                self.valueState.append("Danger")
                                self.valueColor.append(UIColor.redColor())
                            }
                        break
                    case "transmission":
                        self.descriptionState.append("Transmission")
                        if value as! String == "OK"{
                            self.valueState.append("Looks Good")
                            self.valueColor.append(UIColor.greenColor())
                        }else{
                            self.valueState.append("Danger")
                            self.valueColor.append(UIColor.redColor())
                        }
                        break
                    default:
                        break
                    }
                }
                self.stateTableView.reloadData()

                
            }
        
    }
    
    
    
    
}
