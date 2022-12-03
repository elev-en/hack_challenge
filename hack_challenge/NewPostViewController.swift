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
    let postTitleTextField = UITextField()
    let postTextField = UITextField()
    let locationTitleTextField = UITextField()
    let locationTextField = UITextField()
    let box = UILabel()
    let dateTitleTextField = UITextField()
    let datePicker = UIDatePicker()
    //let dateTextField = UITextField()
    let courseTitleTextField = UITextField()
    let courseTextField = UITextField()
    let postBodyTextField = UITextField()
    let postBodyTextView = UITextView()
    let post = UIButton()
    
    
    init(id: Int){
        self.user_id = id
        // TODO; NETWORK manager stuff for courses
        /*courses = NetworkManager.getUserCourses(id: user_id){response in
            print(response)
        }*/
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
        
        post.setTitle("POST", for: .normal)
        post.addTarget(self, action: #selector(sharePost), for: .touchUpInside)
        post.setTitleColor(.systemBlue, for: .normal)
        post.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        post.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(post)

//        saveButton.setTitle("SAVE", for: .normal)
//        saveButton.addTarget(self, action: #selector(changeFieldsAndDismiss), for: .touchUpInside)
//        saveButton.setTitleColor(.systemBlue, for: .normal)
//        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(saveButton)
        
        
        postTitleTextField.text = "POST TITLE"
        postTitleTextField.isUserInteractionEnabled = false
        postTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        postTitleTextField.textColor = UIColor.black
        view.addSubview(postTitleTextField)
        postTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let name = NSAttributedString(string: "enter post title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        postTextField.attributedPlaceholder = name
        postTextField.font = .systemFont(ofSize: 15, weight: .light)
        postTextField.textColor = UIColor.black
        postTextField.backgroundColor = UIColor.systemGray5
        postTextField.layer.borderWidth = 1
        postTextField.layer.borderColor = UIColor.systemGray5.cgColor
        postTextField.layer.cornerRadius = 20
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        postTextField.leftView = paddingView
        postTextField.leftViewMode = .always
        view.addSubview(postTextField)
        postTextField.translatesAutoresizingMaskIntoConstraints = false
        postTextField.autocorrectionType = .no
        postTextField.autocapitalizationType = .none
        
        locationTitleTextField.text = "LOCATION"
        locationTitleTextField.isUserInteractionEnabled = false
        locationTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        locationTitleTextField.textColor = UIColor.black
        view.addSubview(locationTitleTextField)
        locationTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        let website = NSAttributedString(string: "ex: mann library, 2nd floor", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        locationTextField.attributedPlaceholder = website
        locationTextField.font = .systemFont(ofSize: 15, weight: .light)
        locationTextField.textColor = UIColor.black
        locationTextField.backgroundColor = UIColor.systemGray5
        locationTextField.layer.borderWidth = 1
        locationTextField.layer.borderColor = UIColor.systemGray5.cgColor
        locationTextField.layer.cornerRadius = 20
        let paddingView2: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        locationTextField.leftView = paddingView2
        locationTextField.leftViewMode = .always
        view.addSubview(locationTextField)
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.autocorrectionType = .no
        locationTextField.autocapitalizationType = .none
        
        box.numberOfLines = 20
        box.backgroundColor = UIColor.systemGray5
        box.clipsToBounds = true
        box.layer.cornerRadius = 15
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        
        box.numberOfLines = 20
        box.backgroundColor = UIColor.systemGray5
        box.clipsToBounds = true
        box.layer.cornerRadius = 15
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        dateTitleTextField.text = "DATE"
        dateTitleTextField.isUserInteractionEnabled = false
        dateTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        dateTitleTextField.textColor = UIColor.black
        view.addSubview(dateTitleTextField)
        dateTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        courseTitleTextField.text = "COURSE"
        courseTitleTextField.isUserInteractionEnabled = false
        courseTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        courseTitleTextField.textColor = UIColor.black
        view.addSubview(courseTitleTextField)
        courseTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let course = NSAttributedString(string: "cs 2110", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        courseTextField.attributedPlaceholder = course
        courseTextField.font = .systemFont(ofSize: 15, weight: .light)
        courseTextField.textColor = UIColor.black
        courseTextField.backgroundColor = UIColor.systemGray5
        courseTextField.layer.borderWidth = 1
        courseTextField.layer.borderColor = UIColor.systemGray5.cgColor
        courseTextField.layer.cornerRadius = 20
        let paddingView4: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        courseTextField.leftView = paddingView4
        courseTextField.leftViewMode = .always
        view.addSubview(courseTextField)
        courseTextField.translatesAutoresizingMaskIntoConstraints = false
        courseTextField.autocorrectionType = .no
        courseTextField.autocapitalizationType = .none
       
        
        postBodyTextField.text = "POST BODY"
        postBodyTextField.isUserInteractionEnabled = false
        postBodyTextField.font = .systemFont(ofSize: 15, weight: .bold)
        postBodyTextField.textColor = UIColor.black
        view.addSubview(postBodyTextField)
        postBodyTextField.translatesAutoresizingMaskIntoConstraints = false
        
        postBodyTextView.text = "enter more details"
        postBodyTextView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        postBodyTextView.font = .systemFont(ofSize: 15, weight: .light)
        postBodyTextView.textColor = UIColor.black
        postBodyTextView.backgroundColor = UIColor.systemGray5
        postBodyTextView.layer.borderWidth = 1
        postBodyTextView.layer.borderColor = UIColor.systemGray5.cgColor
        postBodyTextView.layer.cornerRadius = 20
        postBodyTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postBodyTextView)
        
        setUpConstraints()
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            post.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            post.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            post.heightAnchor.constraint(equalToConstant: 20),
            post.widthAnchor.constraint(equalToConstant: 50)
        ])


        NSLayoutConstraint.activate([
            postTitleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                , constant: 30),
            postTitleTextField.heightAnchor.constraint(equalToConstant: 30),
            postTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            postTextField.topAnchor.constraint(equalTo: postTitleTextField
                .bottomAnchor, constant: 10),
            postTextField.heightAnchor.constraint(equalToConstant: 50),
            postTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            postTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )

        NSLayoutConstraint.activate([
            locationTitleTextField.topAnchor.constraint(equalTo: postTextField
                .bottomAnchor, constant: 20),
            locationTitleTextField.heightAnchor.constraint(equalToConstant: 20),
            locationTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: locationTitleTextField
                .bottomAnchor, constant: 10),
            locationTextField.heightAnchor.constraint(equalToConstant: 50),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )
        
        
        NSLayoutConstraint.activate([
            dateTitleTextField.topAnchor.constraint(equalTo: locationTextField
                .bottomAnchor, constant: 20),
            dateTitleTextField.heightAnchor.constraint(equalToConstant: 20),
            dateTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: dateTitleTextField
                .bottomAnchor, constant: 10),
            datePicker.heightAnchor.constraint(equalToConstant: 50),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            //datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )
        
        /*
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: dateTitleTextField
                .bottomAnchor, constant: 10),
            dateTextField.heightAnchor.constraint(equalToConstant: 50),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )*/
        
        NSLayoutConstraint.activate([
            courseTitleTextField.topAnchor.constraint(equalTo: datePicker
                .bottomAnchor, constant: 20),
            courseTitleTextField.heightAnchor.constraint(equalToConstant: 20),
            courseTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        
        NSLayoutConstraint.activate([
            courseTextField.topAnchor.constraint(equalTo: courseTitleTextField
                .bottomAnchor, constant: 10),
            courseTextField.heightAnchor.constraint(equalToConstant: 50),
            courseTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            courseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )
        
      
        NSLayoutConstraint.activate([
            box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            box.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            box.topAnchor.constraint(equalTo: datePicker
                .bottomAnchor, constant: 10),
            box.bottomAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10)
        ])

 
        
        NSLayoutConstraint.activate([
            postBodyTextField.topAnchor.constraint(equalTo: courseTextField.bottomAnchor, constant: 50),
            postBodyTextField.heightAnchor.constraint(equalToConstant: 30),
            postBodyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            postBodyTextView.topAnchor.constraint(equalTo: postBodyTextField
                .bottomAnchor, constant: 10),
            postBodyTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            postBodyTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            postBodyTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
                
        
    }
    
    @objc func sharePost(){
        //networking to create new post
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        let somedateString = dateFormatter.string(from: datePicker.date)
        print(somedateString)
        
        NetworkManager.createPostForUser(id: user_id, header: postTextField.text!, body: postBodyTextView.text!, location: locationTextField.text!, meetup_time: somedateString) {_ in}
        self.dismiss(animated: true)
    }
    

}
