//
//  ViewController.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var apiKeyField: NSTextField!
    @IBOutlet var recipientField: NSTextField!

    @IBOutlet var payloadTextView: NSTextView!
    @IBOutlet var responseTextView: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        apiKeyField.stringValue = StoreManager.apiKey
        recipientField.stringValue = StoreManager.recipientToken

        payloadTextView.isAutomaticQuoteSubstitutionEnabled = false
        payloadTextView.isAutomaticDashSubstitutionEnabled = false
        payloadTextView.isAutomaticTextReplacementEnabled = false

        responseTextView.isAutomaticQuoteSubstitutionEnabled = false
        responseTextView.isAutomaticDashSubstitutionEnabled = false
        responseTextView.isAutomaticTextReplacementEnabled = false
    }

    @IBAction func gcmSenderAction(_ sender: AnyObject) {
        storeValueFromFields()
        var requestBody = JsonHelper.prepareRequestBody(recipientField.stringValue)

        if let payload = preparePayload() {
            requestBody = requestBody + payload
        }

      try! RestManager.performRequest(apiKey: apiKeyField.stringValue, paremeters: requestBody) {
        self.responseTextView.string = $0
      }
    }

    func storeValueFromFields() {
        StoreManager.apiKey = apiKeyField.stringValue
        StoreManager.recipientToken = recipientField.stringValue
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
        window?.title = "GCM Sender"
    }
}
