//
//  Profile.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation
import UIKit

struct Profile: Codable {
    let id: Int
    let username: String
    let password: String
    var name: String
    var courses: [Course]
    var bio: String
    var gradYear: Int
    var friends: [Profile]
    var posts: [Post]
    var profileImage: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case username
        case password
        case name
        case courses
        case bio
        case gradYear
        case friends
        case posts
        case profileImage
    }
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
    
    
}
// we will need to add more code here but I'm not exactly sure what
