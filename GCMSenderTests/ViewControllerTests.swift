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
    viewController = storyboard.instantiateController(withIdentifier: "ViewControllerStoryboardId") as? ViewController
    let _ = viewController?.view

  }

  func testApiKeyFieldOutlet() {
    XCTAssertNotNil(viewController?.apiKeyField, "apiKeyField should be connected")
  }

  func testRecipientFieldOutlet() {
    XCTAssertNotNil(viewController?.recipientField, "recipientField should be connected")
  }

  func testpayloadTextViewOutlet() {
    XCTAssertNotNil(viewController?.payloadTextView, "payloadTextView should be connected")
  }

  func testResponseTextViewOutlet() {
    XCTAssertNotNil(viewController?.responseTextView, "responseTextView should be connected")
  }

  func testStoreValueFromField() {
    viewController?.apiKeyField.stringValue = stringValue
    viewController?.recipientField.stringValue = stringValue

    viewController?.storeValueFromFields()

    XCTAssertEqual(StoreManager.apiKey, stringValue)
    XCTAssertEqual(StoreManager.recipientToken, stringValue)
  }

  func testPreparePayloadNil() {
    viewController?.payloadTextView.string = ""
    XCTAssertNil(viewController?.preparePayload())
  }

  func testPreparePayload() {
    let expected  = ["key" : "value"]
    viewController?.payloadTextView.string = "{\"key\":\"value\"}"
    let result = viewController?.preparePayload() as! [String: String]
    XCTAssertEqual(result, expected)
  }

}
