//
//  RefineSearchView.swift
//  Hackathon
//
//  Created by Jonathan Velazquez on 03/01/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class RefineSearchView: UIViewController {

    @IBOutlet weak var passengerAmountView: UIView!
    @IBOutlet weak var waitTimeView: UIView!
    @IBOutlet weak var travelCostView: UIView!
    @IBOutlet weak var travelModeView: UIView!
    
    var passengerAmountPicker = RefineSearchItemView()
    var waitTimePicker = RefineSearchItemView()
    var travelCostPicker = RefineSearchItemView()
    var travelModePicker = RefineSearchItemView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
    func configPickerViews(pickerComponents:[[UIView]]){
        passengerAmountPicker.setData(pickerComponents[0])
        waitTimePicker.setData(pickerComponents[1])
        travelCostPicker.setData(pickerComponents[2])
        travelModePicker.setData(pickerComponents[3])
        
        passengerAmountView.addSubview(passengerAmountPicker.view)
        waitTimeView.addSubview(waitTimePicker.view)
        travelCostView.addSubview(travelCostPicker.view)
        travelModeView.addSubview(travelModePicker.view)
        
    }
    
    func prepareGenericViews(data:[String],firstViewName : String)-> [UIView]{
        var components = [UIView]()
        let firstView = UIImageView(image: UIImage(named: firstViewName))
        components.append(firstView)
        
        for text in data {
            let label = UILabel(frame: self.passengerAmountView.frame)
            label.text = text
            components.append(label)
        }
        
        return components
    }
    
    func setData(passengerAmountData:[String],waitTimeData:[String],travelCostData:[String],travelModeData:[String]){
        
        let passengerAmountComponents = prepareGenericViews(passengerAmountData,firstViewName: "refineSearchView-passengerAmount")
        let waitTimeComponents  = prepareGenericViews(waitTimeData,firstViewName: "refineSearchView-waitTime")
        let travelCostComponents  = prepareGenericViews(travelCostData,firstViewName: "refineSearchView-travelCost")
        let travelComponents  = prepareGenericViews(travelModeData, firstViewName: "refineSearchView-travelMode")
        
        configPickerViews([passengerAmountComponents,waitTimeComponents,travelCostComponents,travelComponents])
    }
    
    
    

}
