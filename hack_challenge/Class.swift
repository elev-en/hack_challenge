//
//  Class.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/25/22.
//

import Foundation


class Course: Codable, Equatable {
    static func == (lhs: Course, rhs: Course) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
    
    let name: String
}
