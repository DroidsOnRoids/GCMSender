//
//  StoreManager.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Foundation

class StoreManager {
    
    private static let UserDefaults = NSUserDefaults.standardUserDefaults()
    private static let ApiKeyStoreName = "ApiKeyStore"
    private static let RecipientTokenStoreName = "RecipientTokenStore"
    
    static var apiKey: String {
        get {
            if let apiKeyValue = UserDefaults.objectForKey(ApiKeyStoreName) {
                return apiKeyValue as! String
            }
            return ""
        }
        
        set(newApiKey) {
            UserDefaults.setObject(newApiKey, forKey: ApiKeyStoreName)
        }
    }
    static var recipientToken: String {
        get {
            if let apiKeyValue = UserDefaults.objectForKey(RecipientTokenStoreName) {
                return apiKeyValue as! String
            }
            return ""
        }
        
        set(newApiKey) {
            UserDefaults.setObject(newApiKey, forKey: RecipientTokenStoreName)
        }
    }
    
    static func clearStore() {
        if let bundleIdentifier = NSBundle.mainBundle().bundleIdentifier {
            UserDefaults.standardUserDefaults().removePersistentDomainForName(bundleIdentifier)
        }
    }
}
