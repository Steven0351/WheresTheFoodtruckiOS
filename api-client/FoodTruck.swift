//
//  FoodTruck.swift
//  api-client
//
//  Created by Steven Sherry on 4/9/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class FoodTruck: NSObject, MKAnnotation {
    var id: String = ""
    var name: String = ""
    var foodType: String = ""
    var averageCost: Double = 0.0
    var geometry: String = "Point"
    var lat: Double = 0.0
    var long: Double = 0.0
    @objc var title: String?
    @objc var subtitle: String?
    
    @objc var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
    }
    
    static func parseFoodTruckJSONData(data: Data) -> [FoodTruck] {
        var foodtrucks = [FoodTruck]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            // Parse JSON Data
            
            if let trucks = jsonResult as? [Dictionary<String, AnyObject>] {
                for truck in trucks {
                    let newTruck = FoodTruck()
                    newTruck.id = truck["_id"] as! String
                    newTruck.name = truck["name"] as! String
                    newTruck.foodType = truck["foodType"] as! String
                    newTruck.averageCost = truck["averageCost"] as! Double
                    let geometry = truck["geometry"] as! Dictionary<String, AnyObject>
                    newTruck.geometry = geometry["type"] as! String
                    let coordinates = geometry["coordinates"] as! Dictionary<String, AnyObject>
                    newTruck.lat = coordinates["lat"] as! Double
                    newTruck.long = coordinates["long"] as! Double
                    newTruck.title = newTruck.name
                    newTruck.subtitle = newTruck.foodType
                    
                    foodtrucks.append(newTruck)
                    
                }
            }
        } catch let err {
            print(err)
        }
        
        return foodtrucks
    }
    
}
