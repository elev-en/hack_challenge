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

struct Course: Codable, Equatable {
    let id: Int
    let code: String
    let name: String
    let users: [User]?
    
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
