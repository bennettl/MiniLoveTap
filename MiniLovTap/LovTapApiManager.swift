//
//  LovTapApiManager.swift
//  MiniLovTap
//
//  Created by Lee Bennett on 10/4/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// Allows us to communicate between iOS <-> Server
class LovTapApiManager{
    
    // Singleton
    static let sharedManager = LovTapApiManager()

    let BASE_API_URL = "http://lovetap.com/api"
    
    func getSearchResults(text: String, type: String, completion: @escaping (JSON) -> Void ){
        
        let path = "\(BASE_API_URL)/search"
        let params = ["text": text, "type": type]
        
        // Make an HTTP request to server to get information back
        Alamofire.request(path, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            let value = response.result.value as? [String : AnyObject]
            
            let json = JSON(value)
            
            let results = json["results"].arrayValue
            
            var searchResults = [SearchResult]()
            
            // Loop through every element in results (JSON) and convert it to SearchResult(native Swift object)
            for result in results{
                
                let id = result["id"].stringValue
                let name = result["name"].stringValue
                let type = result["type"].stringValue
                let imageUrl = result["imageUrl"].stringValue
                
                let sr = SearchResult(id: id, name: name, imageUrl: imageUrl)
                searchResults.append(sr)
            }
            
            completion(json)
        }
        
    }
    
    func createUser(params: [String: AnyObject]){
        let path = "\(BASE_API_URL)/users"
        
        Alamofire.request(path, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            let value = response.result.value as? [String : AnyObject]
            let json = JSON(value)
        }
    }
}




///search?text=jo&type=hashtag
//    
//    {
//        
//        "results": [
//        
//        {
//        "displayName": "#john",
//        "type": "hashtag",
//        "id": "123abc"
//        "imageUrl": null,
//        },
//        {
//        "displayName": "#johnathan",
//        "type": "hashtag",
//        "id": "io23j2io3j"
//        "imageUrl": null,
//        },
//        {
//        "displayName": "#johnny",
//        "type": "hashtag",
//        "id": "woigjio2"
//        "imageUrl": null,
//        }
//        
//        ]
//        
//        
//}







