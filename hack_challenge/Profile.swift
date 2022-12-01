//
//  Profile.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation
import UIKit

struct Profile: Codable, Equatable {
    
    let id: Int
    let username: String
    //let password: String
    var name: String?
    var bio: String?
    var gradYear: Int?
    var posts: [Post]
    var comments: [Comment]
    var courses: [Course]
    var friends: [Profile]
    var session_token: String
    var session_expiration: String
    var update_token: String
    //var profileImage: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case username
        //case password
        case name
        case bio
        case gradYear
        case posts
        case comments
        case courses
        case friends
        case session_token
        case session_expiration
        case update_token
        //case profileImage
    }
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
    
}

struct User: Codable, Equatable{
    let id: Int
    let username: String
    //let password: String
    var name: String?
    var bio: String?
    var gradYear: Int?
    var posts: [Post]
    var comments: [Comment]
    //var profileImage: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case username
        //case password
        case name
        case bio
        case gradYear
        case posts
        case comments
        //case profileImage
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
}


