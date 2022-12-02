//
//  Comment.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Comment: Codable {
    
    let post_id: Int
    let user_id: Int
    let body: String
    //let timeStamp: still need to figure out how to do time stamps
    enum CodingKeys: String, CodingKey{
        case post_id
        case user_id
        case body
        //case timeStamp
    }
}
