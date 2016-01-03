//
//  RefineSearchView.swift
//  Hackathon
//
//  Created by Jonathan Velazquez on 02/01/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class PickerDataSource: NSObject,UIPickerViewDataSource {
    var countData:Int = 0
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return countData
    }
    
    func setData(countData: Int){
        self.countData = countData
    }
    
}

class PickerDelegate: NSObject,UIPickerViewDelegate {
    
    var pickerData = [UIView]()
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        return pickerData[component]
    }
    
    func setData(pickerData: [UIView]){
        self.pickerData = pickerData
    }

}



class RefineSearchView: UIViewController {
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData = [UIView]()
    var pickerDelegate = PickerDelegate()
    var pickerDataSource = PickerDataSource()
    
    
   

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupPicker(){
        picker.delegate = pickerDelegate
        picker.dataSource = pickerDataSource
    }
    
    
    func setData(pickerData:[UIView]){
        self.pickerData = pickerData
        pickerDelegate.setData(pickerData)
        pickerDataSource.setData(pickerData.count)
        
        picker.reloadAllComponents()
        
    }

}





