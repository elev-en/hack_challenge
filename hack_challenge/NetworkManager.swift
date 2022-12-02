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
                print(data)
                if let userResponse = try? jsonDecoder.decode((Profile).self, from: data) {
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
                if let userResponse = try? jsonDecoder.decode((Profile).self, from: data) {
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
                if let userResponse = try? jsonDecoder.decode((Profile).self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getUser")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllUsers(completion: @escaping (ProfileResponse) -> Void) {
        let endpoint = "\(host)users/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode((ProfileResponse).self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllUsers")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func userLogin(username: String, password: String, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/login/"
        let params: Parameters = [
            "username": username,
            "password": password
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode((Profile).self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode userLogin")
                }
            case .failure(let error):
                //
                print(error.localizedDescription)
            }
        }
    }
    
    static func userRenewSession(completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/session/"
        AF.request(endpoint, method: .post, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode userRenewSession")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func userLogout(completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/logout/"
        AF.request(endpoint, method: .post, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode userLogout")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func addCourseToUser(id: Int, course_id: String, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/\(id)/add/course/"
        let params: Parameters = [
            "course_id": course_id
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode addCourseToUser")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createPostForUser(id: Int, header: String, body: String, location: String, meetup_Time: String, completion: @escaping (Profile) -> Void) {
        let endpoint = "\(host)users/\(id)/add/post/"
        let params: Parameters = [
            "header": header,
            "body": body,
            "location": location,
            "meetup_Time": meetup_Time
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Profile.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode createPostForUser")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //----------- Courses ------------//
    
    static func createCourse(code: String, name: String, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)courses/"
        let params: Parameters = [
            "code": code,
            "name": name
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Course.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode createCourse")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getCourse(id: Int, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)courses/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Course.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getCourse")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteCourse(id: Int, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)courses/\(id)/"
        AF.request(endpoint, method: .delete).validate().responseData { response in
            switch response.result {
            case.success(let data):
                let jsonDecoder = JSONDecoder()
                if let  userResponse = try? jsonDecoder.decode(Course.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode deleteCourse")
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllClasses(completion: @escaping (CourseResponse) -> Void) {
        let endpoint = "\(host)courses/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode((CourseResponse).self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllClasses")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //------------POSTS--------------//
    
    static func getAllPosts(completion: @escaping ([Post]) -> Void) {
        let endpoint = "\(host)posts/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Post].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createCommentForPost(id: Int, body: String, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)posts/\(id)/add/"
        let params: Parameters = [
            "user_id": id,
            "body": body
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Course.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode createCommentForPost")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllCommentsForPost(id: Int, completion: @escaping ([Profile]) -> Void) {
        let endpoint = "\(host)posts/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Profile].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllCommnetsForPost")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //-------------FRIENDS--------------//
    
    static func friend(user_id: Int, friend_id: Int, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)friends/\(user_id)/friend/\(friend_id)/"
        AF.request(endpoint, method: .post, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Course.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode friend")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func unfriend(user_id: Int, friend_id: Int, completion: @escaping (Course) -> Void) {
        let endpoint = "\(host)friends/\(user_id)/unfriend/\(friend_id)/"
        AF.request(endpoint, method: .post, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Course.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode unfriend")
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
