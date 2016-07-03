//
//  JsonHelper.swift
//  GCMSender
//
//  Created by Pawel Bednorz on 11/03/16.
//  Copyright © 2016 Droids on Roids. All rights reserved.
//

import Cocoa

class JsonHelper {
    class func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                let alert: NSAlert = NSAlert()
                alert.messageText = "JSON parsing error"
                alert.informativeText = "Error"
                alert.alertStyle = .critical
                alert.addButton(withTitle: "OK")
            }
        }
        return nil
    }
    
    class func prepareRequestBody(_ recipient: String) -> [String:AnyObject] {
        var requestBody = [String : AnyObject]()
        
        requestBody = [
            "to" : recipient
        ]
        
        return requestBody;
    }
}
