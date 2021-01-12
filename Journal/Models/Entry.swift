//
//  Entry.swift
//  Journal
//
//  Created by Omri Horowitz on 1/11/21.
//

import Foundation

class Entry: Codable {
    let title: String
    let body: String
    var timestamp: Double = 0.0
    
    
    
    init(title: String, body: String, timestamp: Double) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
       
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body // timestamp?

    }
}
