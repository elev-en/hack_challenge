//
//  Comment.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Comment: Codable {
    
    let id: Int
    let commenter: Profile
    let body: String
    //let timeStamp: still need to figure out how to do time stamps
    enum CodingKeys: String, CodingKey{
        case id
        case commenter
        case body
        //case timeStamp
    }
}
