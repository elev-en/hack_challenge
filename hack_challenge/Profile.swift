//
//  Profile.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Profile: Codable {
    let id: Int
    let username: String
    let password: String
    let name: String
    let courses: [String]
    let bio: String
    let gradYear: Int
    let friends: [Profile]
    
    enum CodingKeys: String, CodingKey{
        case id
        case username
        case password
        case name
        case courses
        case bio
        case gradYear
        case friends
    }
}
// we will need to add more code here but I'm not exactly sure what
