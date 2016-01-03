//
//  ProfileViewController.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/3/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import UIKit
import Mapbox


class tableDataSource: NSObject,UITableViewDataSource {
    var descriptionTexts = [String]()
    var valueTexts = [String]()
    var valueColors = [UIColor]()
    var tableView:UITableView!
    
    
    
    
    init(tableView:UITableView) {
        self.tableView = tableView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptionTexts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell") as! ProfileCell
        cell.setCell(descriptionTexts[indexPath.row], value: valueTexts[indexPath.row], valueColor: valueColors[indexPath.row])
        return cell
    }
    
    
    func addData(description:String,value:String,valueColor:UIColor){
        descriptionTexts.append(description)
        valueColors.append(valueColor)
        valueTexts.append(value)
        tableView.reloadData()
    }
    
}


class TableDelegate: NSObject,UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
}



class ProfileViewController: UIViewController {
    
    
    
    @IBOutlet weak var stateTableView: UITableView!
    
    var ericssonManager = EricssonManager()
    var isLogged:Bool = false
    var descriptionState = [String]()
    var valueState = [String]()
    var valueColor = [UIColor]()
    
    var grenColor = UIColor(red: 126/155, green: 211/155, blue: 33/155, alpha: 1)
    
    var dataSource:tableDataSource?
    
    @IBOutlet weak var mapaContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login()
        configTable()
        setupMap()
        
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
        dataSource = tableDataSource(tableView: stateTableView)
        stateTableView.dataSource = dataSource
        //stateTableView.delegate = TableDelegate()
    }
    
    
    
    
    func getDiagnosticInfo(){
            ericssonManager.getDiagnosticDataStatus{
                (info)->() in
                var statusReport = info["statusReport"] as! NSDictionary
                for (key,value) in statusReport {
                    
                    switch key as! String {
                        case "abs":
                            if value as! String == "OK"{
                                self.dataSource?.addData("ABS", value: "Good", valueColor: self.grenColor)
                            
                            }else{
                                self.dataSource?.addData("ABS", value: "Danger", valueColor: UIColor.redColor())
                            }
                            break;
                        case "airBags":
                            
                            if value as! String == "OK"{
                                self.dataSource?.addData("AirBags", value: "Good", valueColor: self.grenColor)
                            }else{
                                self.dataSource?.addData("AirBags", value: "Danger", valueColor: UIColor.redColor())
                            }
                        break
                    case "transmission":
                        if value as! String == "OK"{
                            self.dataSource?.addData("Transmission", value: "Good", valueColor: self.grenColor)

                        }else{
                            self.dataSource?.addData("Transmission", value: "Danger", valueColor: UIColor.redColor())
                        }
                        break
                    default:
                        break
                    }
                }
                
            }
        
    }
    
    
    
    
    func setupMap(){
        let mapBoxView = MGLMapView(frame: self.mapaContainerView.frame ,styleURL: MGLStyle.darkStyleURL())
        mapBoxView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mapBoxView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 20.6530501,
            longitude: -103.3913392),
            zoomLevel: 13, animated: false)
        mapaContainerView.addSubview(mapBoxView)
    }

    
    
}
