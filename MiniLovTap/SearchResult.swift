//
//  SearchResult.swift
//  MiniLovTap
//
//  Created by Lee Bennett on 10/4/16.
//  Copyright © 2016 Boston Consulting Group Digital Ventures. All rights reserved.
//

import Foundation

class SearchResult{
    
    var id: String!
    var name: String!
    var imageUrl: String?
    
    init(id: String, name: String, imageUrl: String){
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
}
