//
//  NewPostViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/30/22.
//

import UIKit

class NewPostViewController: UIViewController {
    
    let background = UIImageView()
    let user_id: Int
    let newPostLabel = UILabel()
    let header = UITextField()
    let body = UITextField()
    let loc = UITextField()
    let meetupTime = UITextField()
    let course = UITextField()
    let post = UIButton()
    
    init(id: Int){
        self.user_id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)

        header.text = "Header"
        header.font = .systemFont(ofSize: 20, weight: .bold)
        header.textColor = UIColor(red: 60.0/255.0, green: 52.0/255.0, blue: 112/255.0, alpha: 1)
        view.addSubview(header)
        header.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        header.isUserInteractionEnabled = true
        header.translatesAutoresizingMaskIntoConstraints = false
        
        body.text = "Body"
        body.font = .systemFont(ofSize: 16)
        body.textColor = UIColor(red: 60.0/255.0, green: 52.0/255.0, blue: 112/255.0, alpha: 1)
        view.addSubview(body)
        body.isUserInteractionEnabled = true
        body.translatesAutoresizingMaskIntoConstraints = false
        
        loc.text = "Meeting Location?"
        loc.font = .systemFont(ofSize: 16)
        loc.textColor = UIColor(red: 60.0/255.0, green: 52.0/255.0, blue: 112/255.0, alpha: 1)
        view.addSubview(loc)
        loc.isUserInteractionEnabled = true
        loc.translatesAutoresizingMaskIntoConstraints = false
        
        meetupTime.text = "When to meet?"
        meetupTime.placeholder = "MM/DD/YYYY"
        meetupTime.font = .systemFont(ofSize: 16)
        meetupTime.textColor = UIColor(red: 60.0/255.0, green: 52.0/255.0, blue: 112/255.0, alpha: 1)
        view.addSubview(meetupTime)
        meetupTime.isUserInteractionEnabled = true
        meetupTime.translatesAutoresizingMaskIntoConstraints = false
        
        course.text = "Is this for a specific course?"
        course.font = .systemFont(ofSize: 16)
        course.textColor = UIColor(red: 60.0/255.0, green: 52.0/255.0, blue: 112/255.0, alpha: 1)
        view.addSubview(course)
        course.isUserInteractionEnabled = true
        course.translatesAutoresizingMaskIntoConstraints = false
        
        
        post.setTitle("SHARE", for: .normal)
        post.backgroundColor = UIColor(red: 142.0/255.0, green: 136.0/255.0, blue: 184.0/255.0, alpha: 1)
        post.layer.borderColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        post.layer.borderWidth = 0
        post.layer.cornerRadius = 21
        post.translatesAutoresizingMaskIntoConstraints = false
        post.addTarget(self, action: #selector(sharePost), for: .touchUpInside)
        view.addSubview(post)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
    
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.width*0.10),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.10),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.10),
            header.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: header.bottomAnchor),
            body.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.10),
            body.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.10),
            body.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: view.bounds.height*0.3)
        ])
        
        NSLayoutConstraint.activate([
            loc.topAnchor.constraint(equalTo: body.bottomAnchor),
            loc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.10),
            loc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.10),
            loc.bottomAnchor.constraint(equalTo: body.bottomAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            meetupTime.topAnchor.constraint(equalTo: loc.bottomAnchor),
            meetupTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.10),
            meetupTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.10),
            meetupTime.bottomAnchor.constraint(equalTo: loc.bottomAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            course.topAnchor.constraint(equalTo: meetupTime.bottomAnchor),
            course.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.10),
            course.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.10),
            course.bottomAnchor.constraint(equalTo: meetupTime.bottomAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            post.topAnchor.constraint(equalTo: course.bottomAnchor),
            post.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.3),
            post.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.30),
            post.bottomAnchor.constraint(equalTo: course.bottomAnchor, constant: view.bounds.height*0.1)
        ])
        
        
    }
    
    @objc func sharePost(){
        //networking to create new post
        NetworkManager.createPostForUser(id: user_id, header: header.text!, body: body.text!, location: loc.text!, meetup_time: meetupTime.text!) {_ in}
        self.dismiss(animated: true)
    }
    

}
