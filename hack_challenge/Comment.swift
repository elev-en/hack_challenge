//
//  Comment.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Comment: Codable {
    
    let body: String
    let user_id: Int
    let post_id: Int
    
    enum CodingKeys: String, CodingKey{
        case body
        case user_id
        case post_id
    }
}
