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

    @IBOutlet var payloadTextView: NSTextView!
    @IBOutlet var responseTextView: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        apiKeyField.stringValue = StoreManager.apiKey
        recipientField.stringValue = StoreManager.recipientToken

        payloadTextView.automaticQuoteSubstitutionEnabled = false
        payloadTextView.automaticDashSubstitutionEnabled = false
        payloadTextView.automaticTextReplacementEnabled = false

        responseTextView.automaticQuoteSubstitutionEnabled = false
        responseTextView.automaticDashSubstitutionEnabled = false
        responseTextView.automaticTextReplacementEnabled = false
    }

    @IBAction func gcmSenderAction(sender: AnyObject) {
        storeValueFromFields()
        var requestBody = JsonHelper.prepareRequestBody(recipientField.stringValue)

        if let payload = preparePayload() {
            requestBody = requestBody + payload
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

    func preparePayload() -> [String: AnyObject]? {
        if let payloadText = payloadTextView?.string,
            let payloadDictionary = JsonHelper.convertStringToDictionary(payloadText) {
                return payloadDictionary
        }

        return nil
    }
}

class WindowController: NSWindowController {
    override func windowDidLoad() {
        self.window?.title = "GCM Sender"
    }
}