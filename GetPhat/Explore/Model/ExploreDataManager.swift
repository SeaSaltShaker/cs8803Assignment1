//
//  ExploreDataManager.swift
//  GetPhat
//
//  Created by David Nguyen on 25/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import Foundation

class ExploreDataManager {
    fileprivate var items:[ExploreItem] = []
    
    func fetch() {
        for data in loadData(){
            items.append(ExploreItem(dict: data))
        }
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem {
        return items[index.item]
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        //A guard statement is designed to exit a method or function early when a given statement returns false. Our guard statement checks two statements and both need to return true:
        
        // first statement checks to see whether the ExploreData.plist file exists in our app bundle. If the file is found, the statement returns true, and the file path is set to the constant path.
        
        //  second statement, if the first statement returns true, we take the path constant, and then we check the contents inside of the file.
        
        // NSArray has a method that we can use to get the data out of our file and put it into an array with which we can work.
        
        //Typically, plists come in two types: an array or a dictionary. Currently, neither the standard Swift array nor dictionary gives us a method that allows us to get data out of a file, so we need to utilize NSArray (as we are here) or NSDictionary, respectively, to do that.

        //This statement now checks to verify that we are, indeed, working with an array, and then returns true if so. If both conditions return true, our array inside of our plist is given to us. The array is set to our constant items.
        

        guard let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"), let items = NSArray(contentsOfFile: path)
            else {
                return [[:]]
            }
        
        return items as! [[String : AnyObject]]
    }
}
