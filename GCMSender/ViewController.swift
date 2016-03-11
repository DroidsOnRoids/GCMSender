//
//  ViewController.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Cocoa
import Alamofire

class ViewController: NSViewController {
    
    @IBOutlet var apiKeyField: NSTextField!
    @IBOutlet var recipientField: NSTextField!

    @IBOutlet var payLoadTextView: NSTextView!
    @IBOutlet var responseTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiKeyField.stringValue = StoreManager.apiKey
        recipientField.stringValue = StoreManager.recipientToken
        
        payLoadTextView.automaticQuoteSubstitutionEnabled = false
        payLoadTextView.automaticDashSubstitutionEnabled = false
        payLoadTextView.automaticTextReplacementEnabled = false
        
        responseTextView.automaticQuoteSubstitutionEnabled = false
        responseTextView.automaticDashSubstitutionEnabled = false
        responseTextView.automaticTextReplacementEnabled = false
    }

    @IBAction func gcmSenderAction(sender: AnyObject) {
        self.storeValueFromFields()
        var requestBody = JsonHelper.prepareRequestBody(recipientField.stringValue)
        
        if let payLoadText = payLoadTextView?.string {
            if let payLoadDictionary = JsonHelper.convertStringToDictionary(payLoadText) {
                requestBody = requestBody + payLoadDictionary
            }
        }
        
        RestManager.performRequest(apiKeyField.stringValue, parameters: requestBody) {
            (gcmResponse: Response<AnyObject, NSError>) in
            self.responseTextView.string = gcmResponse.result.debugDescription
        }
    }
    
    func storeValueFromFields() {
        StoreManager.apiKey = self.apiKeyField.stringValue
        StoreManager.recipientToken = self.recipientField.stringValue
    }

}

class WindowController: NSWindowController {
    override func windowDidLoad() {
        self.window?.title = "GCM Sender"
    }
}