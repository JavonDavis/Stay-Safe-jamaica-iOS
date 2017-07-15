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
    var long: Double?
    
    init (category: String?, description: String?, lat: Double?, long: Double?) {
        
        self.category = category
        self.description = description
        self.lat = lat
        self.long = long
    }
    
    static func buildObject(_ report: Report?) -> [String:Any] {
        
        let reportObject = [
            "category": report?.category ?? "",
            "description": report?.description ?? "",
            "location" : [
                "lat": report?.lat,
                "long": report?.long
            ] as! [String: Double]
        
        ] as [String : Any]
        
        return reportObject
    }
    
    static func buildReports(_ reportObjects: [[String: Any]]) -> [Report] {
        
        var reportArray = [Report]()
        
        for report in reportObjects {
            
            let location = report["location"] as! [String:Double]
            
            let reportObject = Report(category: report["category"] as? String, description: report["description"] as? String, lat: location["lat"]!, long: location["long"]! )
            
            reportArray.append(reportObject)
        }
        return reportArray
    }
}
