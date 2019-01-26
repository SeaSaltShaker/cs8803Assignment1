//
//  ExploreItem.swift
//  GetPhat
//
//  Created by David Nguyen on 25/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import Foundation

struct ExploreItem {
    var name:String
    var image:String
    
}

extension ExploreItem {
    init(dict:[String:AnyObject]){
        self.name = (dict["name"] as! String)
        self.image = (dict["image"] as! String)
    }
}
