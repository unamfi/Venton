//
//  EricssonTests.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/2/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import XCTest
@testable import Hackathon

let parameters = ["username" : "provider", "pin": "1234", "vin" : "9429070993"]

class EricssonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testLogin() {
     
        let expectation = self.expectationWithDescription("Login Succeded")

        ASDPRequestManager.sharedManager().login(parameters) { (asdpResult) -> Void in
            print(asdpResult.isSuccess)
            if asdpResult.isSuccess {
                expectation.fulfill()
            }
        }
        
        self.waitForExpectationsWithTimeout(100, handler: nil)
    }
}