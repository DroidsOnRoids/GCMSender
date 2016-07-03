//
//  AppDelegate.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
}

