//
//  DataManager.swift
//  GetPhat
//
//  Created by David Nguyen on 26/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import Foundation

protocol DataManager{
    func load(file name:String) -> [[String:AnyObject]]
}

extension DataManager{
    func load(file name:String) -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),  let items = NSArray(contentsOfFile: path) else { return [[:]] }
        return items as! [[String : AnyObject]]
    }
}
