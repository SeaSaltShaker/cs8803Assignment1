//
//  LocationDataManager.swift
//  GetPhat
//
//  Created by David Nguyen on 26/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import Foundation


class LocationDataManager {
    
    private var locations:[LocationItem] = []

    init() {
        fetch()
    }
    
    func fetch() {
        for location in loadData() {
            locations.append(LocationItem(dict: location))
        }
    }
    
    func numberOfItems() -> Int {
        return locations.count
    }
    
    func locationItem(at index:IndexPath) -> LocationItem {
        return locations[index.item]
    }
    
    private func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "Locations", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String : AnyObject]]
    }
    
    func findLocation(by name:String) -> (isFound:Bool, position:Int) {
        guard let index = locations.index(where: { $0.city == name }) else {
            return (isFound:false, position:0)
        }
        
        return (isFound:true, position:index)
    }
}
