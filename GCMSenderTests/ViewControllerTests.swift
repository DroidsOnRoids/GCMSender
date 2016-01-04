//
//  ViewControllerTests.swifrt.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 18/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Cocoa
import XCTest

@testable import GCMSender

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController?
    let stringValue = "some string value"
    
    override func setUp() {
        super.setUp()
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateControllerWithIdentifier("ViewController") as? ViewController
        
        _ = viewController?.view
    }
    
    func testApiKeyFieldOutlet() {
        XCTAssertNotNil(viewController?.apiKeyField, "apiKeyField should be connected")
    }
    
    func testRecipientFieldOutlet() {
        XCTAssertNotNil(viewController?.recipientField, "recipientField should be connected")
    }
    
    func testPayLoadTextViewOutlet() {
        XCTAssertNotNil(viewController?.payLoadTextView, "payLoadTextView should be connected")
    }
    
    func testResponseTextViewOutlet() {
        XCTAssertNotNil(viewController?.responseTextView, "responseTextView should be connected")
    }
    
    func testConvertStringToDictionary() {
        let jsonString = "{\"name\":\"John Johnson\",\"street\":\"Oslo West 16\",\"phone\":\"555 1234567\"}"
        
        if let parsedJsonDictionary = viewController?.convertStringToDictionary(jsonString) {
           XCTAssertNotNil(parsedJsonDictionary, "JSON string not parsed")
        } else {
            XCTFail()
        }
    }
    
    func testStoreValueFromField() {
        viewController?.apiKeyField.stringValue = stringValue
        viewController?.recipientField.stringValue = stringValue
        
        viewController?.storeValueFromFields()
        
        XCTAssertEqual(StoreManager.apiKey, stringValue)
        XCTAssertEqual(StoreManager.recipientToken, stringValue)
    }
    
    func testRequestBody() {
        let requestBody = [
            "to" : stringValue
        ]
        viewController?.recipientField.stringValue = stringValue
        let generatedRequestBody = viewController?.prepareRequestBody() as! [String:String]
        
        XCTAssertEqual(requestBody, generatedRequestBody)
    }
}