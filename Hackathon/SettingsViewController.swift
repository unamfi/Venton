//
//  ViewController.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/1/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit
import Mapbox




class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var searchRidesTextField: UITextField!
    
    @IBOutlet weak var ridersCountPicker: UIPickerView!
    @IBOutlet weak var waitTimePicker: UIPickerView!
    @IBOutlet weak var ridePricePicker: UIPickerView!
    @IBOutlet weak var rideSearchModePicker: UIPickerView!
    
    
    @IBOutlet weak var mapContainerView: UIView!
    
    
    
    var ridersViews = [UIView]()
    var waitTimeViews = [UIView]()
    var ridePriceViews = [UIView]()
    var rideSearchModeViews = [UIView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupMap()
        getPickerViews()
        setupPickers()
        configView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        searchRidesTextField.resignFirstResponder()
        return true
    }
    
    
    func configView(){
        searchRidesTextField.delegate = self
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        searchRidesTextField.leftView = leftView
        searchRidesTextField.leftViewMode = .Always
    }
    
    
    func setupMap(){
       // let styleURL = NSURL(string: "mapbox://styles/jonhysiker.a85a88cd")
        let mapBoxView = MGLMapView(frame: self.mapContainerView.frame ,styleURL: MGLStyle.darkStyleURL())
        mapBoxView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mapBoxView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 20.6530501,
            longitude: -103.3913392),
            zoomLevel: 13, animated: false)
        mapContainerView.addSubview(mapBoxView)
    }
    
    
    func getPickerViews(){
        ridersViews = generateViews(["1","2","3","4"], imageName: "ridesCount")
        waitTimeViews = generateViews(["5 min","10 min"], imageName: "waitTime")
        ridePriceViews = generateViews(["$20","$50","$100"], imageName: "ridePrice")
        rideSearchModeViews = generateViews(["Coche 1"], imageName: "rideSearchMode")
    }
    
    
    func setupPickers(){
        
        ridersCountPicker.dataSource = self
        ridersCountPicker.delegate = self
        
        waitTimePicker.dataSource = self
        waitTimePicker.delegate = self
        
        ridePricePicker.dataSource = self
        ridePricePicker.delegate = self
        
        rideSearchModePicker.dataSource = self
        rideSearchModePicker.delegate = self
        
        
    }
    
    func generateViews(titles:[String],imageName:String)->[UIView]{
        var componentsViews = [UIView]()
        let firstComponent = UIImageView(image: UIImage(named: imageName))
        firstComponent.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        firstComponent.contentMode = .ScaleAspectFit
        firstComponent.backgroundColor = UIColor.clearColor()
        componentsViews.append(firstComponent)
        for text in titles {
            let labelComponent = UILabel(frame: CGRect(x: 5, y: 5, width: 70, height: 20))
            labelComponent.text = text
            labelComponent.textColor = UIColor.whiteColor()
            labelComponent.backgroundColor = UIColor.clearColor()
            componentsViews.append(labelComponent)
        }
        return componentsViews
    }
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case ridersCountPicker:
            return ridersViews.count
        case waitTimePicker:
            return waitTimeViews.count
        case ridePricePicker:
            return ridePriceViews.count
        case rideSearchModePicker:
            return rideSearchModeViews.count
        default:
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var vista = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        vista.backgroundColor = UIColor.blackColor()
        switch pickerView {
        case ridersCountPicker:
            vista.addSubview(ridersViews[row])
            return vista
        case waitTimePicker:
            vista.addSubview(waitTimeViews[row])
            return vista
        case ridePricePicker:
            
            return ridePriceViews[row]
        case rideSearchModePicker:
            return rideSearchModeViews[row]
        default:
            return rideSearchModeViews[row]
        }
    }
    
    /*func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case ridersCountPicker:
            return "rides"
        case waitTimePicker:
            return "wait"
        case ridePricePicker:
            return "ride"
        case rideSearchModePicker:
            return "rideSearch"
        default:
            return ""
        }
    }*/
    
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 40

    }
    
    
    
    

}

