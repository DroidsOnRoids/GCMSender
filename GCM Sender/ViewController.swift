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
        var requestBody = self.prepareRequestBody()
        
        if let payLoadText = payLoadTextView?.string {
            if let payLoadDictionary = convertStringToDictionary(payLoadText) {
                requestBody = requestBody + payLoadDictionary
            }
        }
        
        RestManager.performRequest(apiKeyField.stringValue, parameters: requestBody) {
            (gcmResponse: Response<AnyObject, NSError>) in
            self.responseTextView.string = gcmResponse.result.debugDescription
        }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
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
    
    func storeValueFromFields() {
        StoreManager.apiKey = self.apiKeyField.stringValue
        StoreManager.recipientToken = self.recipientField.stringValue
    }
    
    func prepareRequestBody() -> [String:AnyObject] {
        var requestBody = [String : AnyObject]()
        
        requestBody = [
            "to" : self.recipientField.stringValue
        ]
        
        return requestBody;
    }
}

class WindowController: NSWindowController {
    override func windowDidLoad() {
        self.window?.title = "GCM Sender"
    }
}