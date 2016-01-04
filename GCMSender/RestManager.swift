//
//  RestManager.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Foundation
import Alamofire

class RestManager: NSObject {
    
    private static let GCMSendUrl = "https://gcm-http.googleapis.com/gcm/send";
    
    class func performRequest(apiKey: String, parameters: Dictionary<String, AnyObject>, completion: (result: Response<AnyObject, NSError>) -> Void) {
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "key=" + apiKey
        ]
        
        Alamofire.request(.POST, GCMSendUrl, parameters: parameters, encoding: .JSON, headers: headers)
            .responseJSON { response -> Void in
                completion(result: response)
        }
    }
}