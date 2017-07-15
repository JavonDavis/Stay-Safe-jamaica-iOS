//
//  Models.swift
//  Stay Safe Jamaica
//
//  Created by Jamel Reid  on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation


struct Report {
    
    var category: String?
    var description: String?
    var lat: Double?
    var lon: Double?
    
    init (category: String?, description: String?, lat: Double?, long: Double?) {
        
        self.category = category
        self.description = description
        self.lat = lat
        self.lon = long
    }
    
    static func buildObject(_ report: Report?) -> [String:Any] {
        
        let reportObject = [
            "category": report?.category ?? "",
            "description": report?.description ?? "",
            "location" : [
                "lat": report?.lat,
                "long": report?.lon
            ] as! [String: Double]
        
        ] as [String : Any]
        
        return reportObject
    }
    
    static func buildReports(_ reportObjects: [String: Any]) -> [Report] {
        
        var reportArray = [Report]()
        
        for (_, value) in reportObjects {
            
            if let object = value as? [String: Any] {
                if let location = object["location"] as? [String:Double] {
        
                    let reportObject = Report(category: object["category"] as? String, description: object["description"] as? String, lat: location["lat"]!, long: location["long"]! )
                    
                    reportArray.append(reportObject)
                }
            }
        }
        
        print(reportArray)
        
        return reportArray
        
    }
}
