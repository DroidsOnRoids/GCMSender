//
//  DictionaryTests.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 17/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import XCTest

@testable import GCMSender

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

  func testAdditionDifferentDictionaries() {
    let compainedDictionary = dictionaryOne + dictionaryTwo

    XCTAssertEqual(compainedDictionary, finalDictionary)
  }

  func testAdditionEqualDictionaries() {
    let compainedDictionary = dictionaryOne + dictionaryOne + dictionaryOne

    XCTAssertEqual(compainedDictionary, dictionaryOne)
  }
}

