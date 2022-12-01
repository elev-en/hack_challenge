//
//  Class.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/25/22.
//

import Foundation


//class Course: Codable, Equatable {
//    static func == (lhs: Course, rhs: Course) -> Bool {
//        if lhs.name == rhs.name { return true }
//        return false
//    }
//
//    let name: String
//}

struct Course: Codable {
    let id: Int
    let code: String
    let name: String
    let users: [Profile]
    
    enum CodingKeys: String, CodingKey{
        case id
        case code
        case name
        case users
    }
}

struct CourseResponse: Codable {
    let courses: [Course]
}
