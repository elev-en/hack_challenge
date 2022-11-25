//
//  Profile.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation

struct Profile: Codable {
    let username: String
    let password: String
    let name: String
    let courses: [String]
    let bio: String
    let gradYear: Int
    let friends: [Profile]
    
    enum CodingKeys: String, CodingKey{
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
