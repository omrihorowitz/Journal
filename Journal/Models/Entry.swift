//
//  Entry.swift
//  Journal
//
//  Created by Omri Horowitz on 1/11/21.
//

import Foundation

class Entry: Codable {
    var title: String
    var body: String
    var timestamp: Date
    
    init(title: String, body: String, timestamp: Date = Date()) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
       
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.timestamp == rhs.timestamp

    }
}
