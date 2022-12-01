//
//  Session.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/30/22.
//

import Foundation

struct UserResponse: Codable {
    
    let session_token: String
    let session_expiration: String
    let update_token: String
    
    init(session_token: String, session_expiration: String, update_token: String) {
        
        self.session_token = session_token
        self.session_expiration = session_expiration
        self.update_token = update_token
        
    }
    
}
