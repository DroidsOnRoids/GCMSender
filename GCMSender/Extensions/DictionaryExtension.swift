//
//  DictionaryExtension.swift
//  GCM Sender
//
//  Created by Pawel Bednorz on 09/12/15.
//  Copyright © 2015 Droids on Roids. All rights reserved.
//

import Foundation

func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>) -> Dictionary<K,V> {
  var map = Dictionary<K,V>()

  for (k, v) in left {
    map[k] = v
  }
  
  for (k, v) in right {
    map[k] = v
  }

  return map
}
