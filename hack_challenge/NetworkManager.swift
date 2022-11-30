//
//  NetworkManager.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/23/22.
//

import Alamofire
import Foundation

class NetworkManager {

    static let host = "http://34.150.155.25/api/"
    
    static func createUser(username: String, password: String, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/"
        let params: Parameters = [
            "username": username,
            "password": password
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                    print("created user")
                } else {
                    print("Failed to decode createUser")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func updateUser(id: Int, name: String, bio: String, gradYear: Int, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/\(id)/"
        let params: Parameters = [
            "name": name,
            "bio": bio,
            "gradYear": gradYear
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode updateUser")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUser(id: Int, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getUser")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllClasses(completion: @escaping ([Course]) -> Void) {
        let endpoint = "\(host)courses/"
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
                    print("Failed to decode getAllProfiles")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
