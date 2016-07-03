//
//  StoreManager.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Foundation

class StoreManager {

  private enum Keys: String {
    case apiKeyStore
    case recipientTokenStore
  }

  private static let UserDefaults = Foundation.UserDefaults.standard()

  static var apiKey: String {
    get {
      return getValue(key: Keys.apiKeyStore.rawValue)
    }

    set(newApiKey) {
      UserDefaults.set(newApiKey, forKey: Keys.apiKeyStore.rawValue)
    }
  }

  static var recipientToken: String {
    get {
      return getValue(key: Keys.recipientTokenStore.rawValue)
    }

    set(newApiKey) {
      UserDefaults.set(newApiKey, forKey: Keys.recipientTokenStore.rawValue)
    }
  }

  private static func getValue(key: String) -> String {
    guard let storedValue = UserDefaults.string(forKey: key) else {
      return ""
    }

    return storedValue
  }

  static func clearStore() {
    if let bundleIdentifier = Bundle.main().bundleIdentifier {
      UserDefaults.removePersistentDomain(forName: bundleIdentifier)
    }
  }
}
