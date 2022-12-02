//
//  Class.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/25/22.
//

import Foundation


struct Course: Codable, Equatable {
    let id: Int
    let code: String
    let name: String
    let users: [Profile]?
    
    enum CodingKeys: String, CodingKey{
        case id
        case code
        case name
        case users
    }
    
    static func == (lhs: Course, rhs: Course) -> Bool {
        if lhs.code == rhs.code { return true }
        return false
    }
}

struct CourseResponse: Codable {
    let courses: [Course]
}
