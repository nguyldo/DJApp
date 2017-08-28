//
//  KeyGenerator.swift
//  DJApp
//
//  Created by Nguyen Do on 8/26/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import Foundation

class KeyGenerator {
    
    final let availableChars: NSString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890" // all possible chars for generated key
    private var key: String! // key
    private var lengthOfKey: Int! // length of key, can change based on initializer
    
    init() {
    
        key = generateNewKey()
        lengthOfKey = 6 // default size of 6
    
    }
    
    init(length: Int) {
        
        key = generateNewKey()
        lengthOfKey = length
        
    }
    
    // generate a new key, public func
    public func generateNewKey() -> String {
        
        var newKey = ""
        let length = availableChars.length
        
        for _ in 0 ..< lengthOfKey {
            let rand = arc4random_uniform(UInt32(length))
            var nextChar = availableChars.character(at: Int(rand))
            newKey += NSString(characters: &nextChar, length: 1) as String
        }
        
        return newKey
    }
    
    // get the key
    public func getKey() -> String {
    
        return key
    
    }
    
}
