    //
//  DatabaseManager.swift
//  Stay Safe Jamaica
//
//  Created by Jamel Reid  on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation

class DatabaseManager {
    
    static var shared = DatabaseManager()
    
    func createReport( report: Report, completion: @escaping (Bool) ->()) {
        
        let serverUrl = Path.SERVER_URL + Path.POST_REPORT;
        
        let objectPatameters = Report.buildObject(report)
        
        HttpManager.shared.post(url: serverUrl, parameters: objectPatameters, completion: { response in
            
            if let serverResponse = response.result.value as? [String : Any] {
                if let error = serverResponse["error"] as? String {
                    print("Server Error \(error)")
                    completion(false)
                } else {
                    if let success = serverResponse["success"] as? Bool {
                        print("Sucess: \(success)")
                        completion(success)
                    }
                }
            } else {
                print(response)
                completion(false)
            }
        });
        
    }
    
    func getReports(completion: @escaping ([Report]?, Error?) -> ()){
        
        let serverUrl = Path.SERVER_URL + Path.POST_LIST
        
        print(serverUrl)
        
        HttpManager.shared.get(url: serverUrl, completion: { response  in
            
            if let results = response.result.value as? [String: Any] {
                
                let reportArray = Report.buildReports(results)
                
                completion(reportArray, nil)
            } else {
                
                if let error = response.error {
                    completion(nil, error)
                } else {
                    let error = response.result.value as? String
                    let userInfo = [NSLocalizedDescriptionKey : error]
                    completion(nil, NSError(domain: "ServerError", code: 1, userInfo: userInfo))
                }
                
            }
        });
    }
    
    
}
