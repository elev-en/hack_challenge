//
//  NetworkManager.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/23/22.
//

import Alamofire
import Foundation

class NetworkManager {

    static let host = "ttp://0.0.0.0:8000/api/"

    static func getUser(username: String, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/\(username)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllClasses(completion: @escaping ( (Course)) -> Void) {
        let endpoint = "\(host)courses/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([String].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
}
