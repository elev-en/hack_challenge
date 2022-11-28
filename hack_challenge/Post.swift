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
    let timeStamp: String
    let location: String
    let comments: [Comment]
    
    enum CodingKeys: String, CodingKey{
        case poster
        case header
        case body
        case location
        case timeStamp
        case comments
    }
}
