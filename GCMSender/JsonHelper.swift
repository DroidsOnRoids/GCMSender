//
//  JsonHelper.swift
//  GCMSender
//
//  Created by Pawel Bednorz on 11/03/16.
//  Copyright © 2016 Droids on Roids. All rights reserved.
//

import Cocoa

class JsonHelper {
    class func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
                return json
            } catch {
                let alert: NSAlert = NSAlert()
                alert.messageText = "JSON parsing error"
                alert.informativeText = "Error"
                alert.alertStyle = .CriticalAlertStyle
                alert.addButtonWithTitle("OK")
            }
        }
        return nil
    }
    
    class func prepareRequestBody(recipient: String) -> [String:AnyObject] {
        var requestBody = [String : AnyObject]()
        
        requestBody = [
            "to" : recipient
        ]
        
        return requestBody;
    }
}