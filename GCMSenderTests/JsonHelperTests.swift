//
//  JsonHelperTests.swift
//  GCMSender
//
//  Created by Pawel Bednorz on 11/03/16.
//  Copyright © 2016 Droids on Roids. All rights reserved.
//

import XCTest
@testable import GCMSender

class JsonHelperTests: XCTestCase {
    
    func testConvertStringToDictionary() {
        let jsonString = "{\"name\":\"John Johnson\",\"street\":\"Oslo West 16\",\"phone\":\"555 1234567\"}"
        
        if let parsedJsonDictionary = JsonHelper.convertStringToDictionary(jsonString) {
            XCTAssertNotNil(parsedJsonDictionary, "JSON string not parsed")
        } else {
            XCTFail()
        }
    }
    
    func testRequestBody() {
        let stringValue = "some string value"
        
        let requestBody = ["to" : stringValue]
        
        let generatedRequestBody = JsonHelper.prepareRequestBody(stringValue) as! [String:String]
        
        XCTAssertEqual(requestBody, generatedRequestBody)
    }

}
