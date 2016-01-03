//
//  EricssonTests.swift
//  Hackathon
//
//  Created by Julio César Guzman on 1/2/16.
//  Copyright © 2016 Julio. All rights reserved.
//

import XCTest
@testable import Hackathon

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
        let ericssonManager = EricssonManager()
        
        ericssonManager.logIn { (success) -> () in
            if success {
                expectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(1, handler: nil)
    }
    
}