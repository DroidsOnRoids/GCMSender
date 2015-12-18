//
//  AppDelegateTests.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 18/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import XCTest

@testable import GCM_Sender

class AppDelegateTests: XCTestCase {
    
    func testApplicationShouldTerminateAfterLastWindowClosed() {
        let sharedApplication = NSApplication.sharedApplication()
        let appDelegate = AppDelegate()
        let result = appDelegate.applicationShouldTerminateAfterLastWindowClosed(sharedApplication)
        XCTAssertTrue(result)
    }
}