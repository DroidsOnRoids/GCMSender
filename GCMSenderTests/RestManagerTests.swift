//
//  RestManagerTests.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 18/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import XCTest

@testable import GCMSender

class RestManagerTests: XCTestCase {

  func testPerformRequest() {
    let expectation = self.expectation(withDescription: "Perform request")

    var requestBody = [String : AnyObject]()

    requestBody = [
      "key" : "value"
    ]

    do {
      try RestManager.performRequest(apiKey: "", paremeters: requestBody) {
        print($0)
        expectation.fulfill()
      }
    } catch {
      XCTFail()
    }

    waitForExpectations(withTimeout: 10, handler: nil)
  }
}
