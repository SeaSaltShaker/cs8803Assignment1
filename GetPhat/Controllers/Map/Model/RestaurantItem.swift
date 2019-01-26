//
//  RestaurantItem.swift
//  GetPhat
//
//  Created by David Nguyen on 26/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import UIKit
import MapKit

class RestaurantItem: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D //added to avoid errors...
    
    var name:String?
    var cuisines:[String] = []
    var lat:Double?
    var long:Double?
    var address:String?
    var postalCode:String?
    var state:String?
    var imageURL:String?
    
    init(dict:[String:AnyObject]){
        if let lat = dict["lat"] as? Double {self.lat = lat}
        if let long = dict["long"] as? Double {self.long = long}
        if let name = dict["name"] as? String {self.name = name}
        if let cuisines = dict["cuisines"] as? [String] {self.cuisines = cuisines}
        if let address = dict["address"] as? String {self.address = address}
        if let postalCode = dict["postal_code"] as? String {self.postalCode = postalCode}
        if let state = dict["state"] as? String {self.state = state}
        if let image = dict["image_url"] as? String {self.imageURL = image}
        
        self.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!) //added to avoid errors...
        

        var coordinate: CLLocationCoordinate2D? {
            guard let lat = lat, let long = long else {return CLLocationCoordinate2D() }
            self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long) //added to avoid errors...
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
        }
        
        var title: String? {
            return name
        }
        
        var subtitle: String? {
            if cuisines.isEmpty {return ""}
            else if cuisines.count == 1 {return cuisines.first}
            else {return cuisines.joined(separator: ", ")}
        }
        
        

    }
}
