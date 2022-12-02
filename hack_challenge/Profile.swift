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
    var name: String?
    var bio: String?
    var grad_year: Int?
    var picture_id: String?
    var number: String?
    var posts: [Post]?
    var comments: [Comment]?
    var courses: [Course]?
    var posts_attending: [Post]?
    var friends: [Profile]?
    var session_token: String?
    var session_expiration: String?
    var update_token: String?
    //var profileImage: String

    enum CodingKeys: String, CodingKey{
        case id
        case username
        case name
        case bio
        case grad_year
        case picture_id
        case number
        case posts
        case comments
        case courses
        case posts_attending
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
    
//    let id: Int
//    let username: String
//    var name: String?
//    var bio: String?
//    var grad_year: Int?
//    var posts: [Post]
//    var comments: [Comment]
//    var courses: [Course]
//    var friends: [Friend]
//    var session_token: String
//    var session_expiration: String
//    var update_token: String
//    //var profileImage: String
//
//    enum CodingKeys: String, CodingKey{
//        case id
//        case username
//        case name
//        case bio
//        case grad_year
//        case posts
//        case comments
//        case courses
//        case friends
//        case session_token
//        case session_expiration
//        case update_token
//        //case profileImage
//    }
//
//    static func == (lhs: Profile, rhs: Profile) -> Bool {
//        if lhs.name == rhs.name { return true }
//        return false
//    }
    
}
//
//struct FriendsList: Codable{
//    var friends: [Profile]
//}

/*struct Friend: Codable, Equatable {
    
    let id: Int
    let username: String
    var name: String?
    var bio: String?
    var grad_year: Int?
    var posts: [Post]
    var comments: [Comment]
    //var session_token: String
    //var session_expiration: String
    //var update_token: String
    var pic_id: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case username
        case name
        case bio
        case grad_year
        case posts
        case comments
        //case session_token
        //case session_expiration
        //case update_token
        case pic_id
    }
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
    
}*/

/*struct User: Codable, Equatable{
    let id: Int
    let username: String
    //let password: String
    var name: String?
    var bio: String?
    var grad_year: Int?
    var posts: [Post]
    var comments: [Comment]
    //var profileImage: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case username
        //case password
        case name
        case bio
        case grad_year
        case posts
        case comments
        //case profileImage
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
}*/

struct ProfileResponse: Codable{
    var users: [Profile]
    
    enum CodingKeys: String, CodingKey{
        case users
    }
}


