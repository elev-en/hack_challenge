//
//  Post.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Post: Codable {
    let id: Int
    let poster: Profile
    let header: String
    let body: String
    let timeStamp: String
    let location: String
    let comments: [Comment]
    let course: Course
    
    enum CodingKeys: String, CodingKey{
        case id
        case poster
        case header
        case body
        case location
        case timeStamp
        case comments
        case course
    }
}

struct PostResponse: Codable{
    var posts: [Post]
    
    enum CodingKeys: String, CodingKey{
        case posts
    }
}
