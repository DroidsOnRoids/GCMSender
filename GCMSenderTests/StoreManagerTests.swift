//
//  GCM_SenderTests.swift
//  GCM SenderTests
//
//  Created by Pawel Bednorz on 17/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import XCTest

@testable import GCMSender

class StoreManagerTests: XCTestCase {
    
    let testValue = "Test value to save"
    let emptyString = ""
    
    func testApiKeyReadEmpty() {
        StoreManager.clearStore()
        XCTAssertEqual(StoreManager.apiKey, emptyString, "apiKey shoud be empty string")
    }
    
    func testApiKeySave() {
        StoreManager.apiKey = testValue
        XCTAssertEqual(StoreManager.apiKey, testValue)
    }
    
    func testRecipientTokenReadEmpty() {
        StoreManager.clearStore()
        XCTAssertEqual(StoreManager.recipientToken, emptyString, "apiKey shoud be empty string")
    }
    
    func testRecipientTokenRead() {
        XCTAssertNotNil(StoreManager.recipientToken);
    }
    
    func testRecipientTokenSave() {
        StoreManager.recipientToken = testValue
        XCTAssertEqual(StoreManager.recipientToken, testValue)
    }
}
