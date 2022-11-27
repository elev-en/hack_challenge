//
//  NetworkManager.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/23/22.
//

import Alamofire
import Foundation

class NetworkManager {

    static let host = "http://0.0.0.0:8000/api/"

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
    
    static func getAllClasses(completion: @escaping ([Course]) -> Void) {
        let endpoint = "34.150.155.25/api/courses/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data): 
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Course].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllClasses")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    static func getAllProfiles(completion: @escaping ([Profile]) -> Void) {
        let endpoint = "\(host)profiles/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Profile].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllrofiles")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
