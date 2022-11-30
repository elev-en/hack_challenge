//
//  Profile.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/18/22.
//

import Foundation
import UIKit

struct Profile: Codable {
    let username: String
    let password: String
    let name: String
    let courses: [Course]
    let bio: String
    let gradYear: Int
    let friends: [Profile]
    let posts: [Post]
    let profileImage: String
    
    enum CodingKeys: String, CodingKey{
        case username
        case password
        case name
        case courses
        case bio
        case gradYear
        case friends
        case posts
        case profileImage
    }
}
// we will need to add more code here but I'm not exactly sure what
