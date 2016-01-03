//
//  SearchResultsViewController.swift
//  Hackathon
//
//  Created by Jonathan Velazquez on 03/01/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class SearchRidesResultsTableViewDelegate : NSObject, UITableViewDelegate {
    
}

class SearchRidesResultsMockedModel : NSObject {
    
    var cells = [["name":"Jonathan Velazquez", "price": "free", "image":"jonathan", "carImage":"coche"],
                 ["name":"Michelle Diaz", "price": "1☕️","image":"michelle", "carImage":"camioneta"],
                 ["name":"César Aguirre", "price":"$120", "image": "cesar", "carImage": "taxi"]]
}

class SearchRidesResultsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var PhotoButton: CircleButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
}

class SearchRidesResultsTableViewDataSource : NSObject, UITableViewDataSource {
    
    var model = SearchRidesResultsMockedModel()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.cells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCellWithIdentifier("cell");
        if let cell = reusableCell as? SearchRidesResultsTableViewCell {
            
            let mockedCell = model.cells[indexPath.row]
            
            cell.PhotoButton.setBackgroundImage(UIImage(named: mockedCell["image"]!), forState: .Normal)
            cell.nameLabel.text = mockedCell["name"]
            cell.priceLabel.text = mockedCell["price"]
            cell.carImageView.image = UIImage(named: mockedCell["carImage"]!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let cell = model.cells.removeAtIndex(sourceIndexPath.row)
        model.cells.insert(cell, atIndex: destinationIndexPath.row)
    }

}

class SearchRidesResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchRidesResultsTableViewDelegate = SearchRidesResultsTableViewDelegate()
    let searchRidesResultsTableViewDataSource = SearchRidesResultsTableViewDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = searchRidesResultsTableViewDataSource
        tableView.delegate = searchRidesResultsTableViewDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
