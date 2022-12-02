//
//  SearchViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    // four buttons that controll what will be searched for: profiles, courses, posts
    // we should probably have three push controllers for each search feature
    let background = UIImageView()
    let searchByLabel = UILabel()
    let profileButton = UIButton()
    let postButton = UIButton()
    let courseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        searchByLabel.text = "Search by"
        searchByLabel.font = .systemFont(ofSize: 20, weight: .bold)
        searchByLabel.textAlignment = .center
        searchByLabel.adjustsFontForContentSizeCategory = true
        searchByLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchByLabel)
        
        profileButton.setTitle("PROFILES", for: .normal)
        profileButton.addTarget(self, action: #selector(pushProfileSearchViewController), for: .touchUpInside)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.layer.cornerRadius = 5
        profileButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        profileButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        postButton.setTitle("POSTS", for: .normal)
        postButton.addTarget(self, action: #selector(pushPostSearchViewController), for: .touchUpInside)
        postButton.setTitleColor(.white, for: .normal)
        postButton.layer.cornerRadius = 5
        postButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postButton)
        
        courseButton.setTitle("COURSES", for: .normal)
        courseButton.addTarget(self, action: #selector(pushCoursesSearchViewController), for: .touchUpInside)
        courseButton.setTitleColor(.white, for: .normal)
        courseButton.layer.cornerRadius = 5
        courseButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        courseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        courseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(courseButton)
        
        setupConstraints()
        
    }
    
    @objc func pushProfileSearchViewController(){
        navigationController?.pushViewController(ProfileSearchPushViewController(), animated: true)
    }
    
    @objc func pushPostSearchViewController(){
        navigationController?.pushViewController(PostSearchPushViewController(), animated: true)
    }
    
    @objc func pushCoursesSearchViewController(){
        navigationController?.pushViewController(CoursesSearchViewController(), animated: true)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            searchByLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchByLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: searchByLabel.bottomAnchor, constant: view.bounds.height*0.03),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            profileButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)
        ])
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: view.bounds.height*0.03),
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            postButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)
        ])
        
        NSLayoutConstraint.activate([
            courseButton.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: view.bounds.height*0.03),
            courseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            courseButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            courseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)
        ])
    }
    
}
