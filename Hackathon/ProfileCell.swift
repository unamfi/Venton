//
//  ProfileCell.swift
//  Hackathon
//
//  Created by Jonathan Velazquez on 03/01/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(description:String,value:String,valueColor:UIColor){
        descriptionLabel.text = description
        valueLabel.text = value
        valueLabel.textColor = valueColor
    }

}
