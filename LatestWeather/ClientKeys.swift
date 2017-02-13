//
//  ClientKeys.swift
//  LatestWeather
//
//  Created by Leke Abolade on 13/02/2017.
//  Copyright © 2017 Leke Abolade. All rights reserved.
//

import Foundation

class ClientKeys {
    
    func valueForAPIKey(named keyname: String) -> String {
    let filePath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile: filePath!)
    let value = plist?.object(forKey: keyname) as! String
    
    return value
    }
}
