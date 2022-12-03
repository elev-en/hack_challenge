//
//  Post.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Post: Codable {
    let id: Int
    let header: String
    let body: String
    let timestamp: String
    let location: String
    let meetupTime: String
    let user_id: Int
    let course: String
    let comments: [Comment]
    let post_attendees: [Profile]?
    //let course: Course
    
    enum CodingKeys: String, CodingKey{
        case id
        case header
        case body
        case location
        case timestamp
        case meetupTime
        case user_id
        case course
        case comments
        case post_attendees
        //case course
    }
}

struct PostResponse: Codable{
    var posts: [Post]
    enum CodingKeys: String, CodingKey{
        case posts
    }
}
