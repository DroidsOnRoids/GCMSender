//
//  DictionaryTests.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 17/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import XCTest

@testable import GCM_Sender

class DictionaryTests: XCTestCase {
    
    let dictionaryOne = [
        "key0" : "value"
    ]
    
    let dictionaryTwo = [
        "key1" : "value"
    ]
    
    let finalDictionary = [
        "key0" : "value",
        "key1" : "value"
    ]
    
    func testCompainDictionaries() {
        let compainedDictionary = dictionaryOne + dictionaryTwo
        
        XCTAssertEqual(compainedDictionary, finalDictionary)
    }
}

