//
//  Post.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Post: Codable {
    let poster: Profile
    let header: String
    let body: String
    //let timeStamp: not sure how to make the time stamp
    let location: String
    //let meetTime: not sure how to make this either but I wonder if we could have one of those scrollable date/time setters when we first create the post
    let comments: [Comment]
    
    enum CodingKeys: String, CodingKey{
        case poster
        case header
        case body
        //case timeStamp
        case location
        //case meetTime
        case comments
    }
}
