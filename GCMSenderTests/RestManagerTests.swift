//
//  RestManagerTests.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 18/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Alamofire
import XCTest

@testable import GCMSender

class RestManagerTests: XCTestCase {
    
    func testPerformRequest() {
        let expectation = self.expectationWithDescription("Perform request")
        
        var requestBody = [String : AnyObject]()
        
        requestBody = [
            "key" : "value"
        ]
        
        RestManager.performRequest("", parameters: requestBody) {
            (gcmResponse: Response<AnyObject, NSError>) in
            XCTAssertNotNil(gcmResponse.result.debugDescription)
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10, handler: nil)
    }
}