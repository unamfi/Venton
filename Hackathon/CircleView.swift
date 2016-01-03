//
//  CircleView.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/3/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import Foundation
import UIKit
import Spring

@IBDesignable
class CircleButton: SpringButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initialize()
    }
    
    func initialize() {
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.clipsToBounds = true
    }
    
    
}