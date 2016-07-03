//
//  RestManager.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 08/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Foundation

class RestManager {

  private static let apiURL = "https://gcm-http.googleapis.com/gcm/send";

  class func performRequest(apiKey: String,
                            paremeters: [String: AnyObject],
                            completion: ((String)?) -> Void) throws {

    guard let url = URL(string: apiURL) else {
      completion(nil)
      return
    }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("key=\(apiKey)", forHTTPHeaderField: "Authorization")


    URLSession.shared().dataTask(with:request) { (data, response, error) in
      var responseString = ""

      if let data = data,
        let dataString = String(data: data, encoding: String.Encoding.utf8) {
        responseString = dataString
      }

      if let erroDescription = error?.localizedDescription
        where responseString.characters.count == 0 {
        responseString = erroDescription
      }

      completion(responseString)
    }.resume()


  }

}
