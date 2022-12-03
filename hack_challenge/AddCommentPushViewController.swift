//
//  AddCommentPushViewController.swift
//  hack_challenge
//
//  Created by kaitlyn on 12/1/22.
//

import UIKit

class AddCommentPushViewController: UIViewController {

    let user_id: Int
    let post_id: Int
    let headerLabel = UILabel()
    let commentTitleTextField = UITextField()
    let commentTextField = UITextField()
    let saveButton = UIButton()
    
    init(user_id: Int, post_id: Int){
        self.user_id = user_id
        self.post_id = post_id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)

        title = "add comment"
        
        headerLabel.numberOfLines = 40
        headerLabel.backgroundColor = .systemGray6
        headerLabel.clipsToBounds = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.addTarget(self, action: #selector(changeFieldsAndDismiss), for: .touchUpInside)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        
        commentTitleTextField.text = "COMMENT"
        commentTitleTextField.isUserInteractionEnabled = false
        commentTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        commentTitleTextField.textColor = UIColor.black
        view.addSubview(commentTitleTextField)
        commentTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let name = NSAttributedString(string: "enter comment", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        commentTextField.attributedPlaceholder = name
        commentTextField.font = .systemFont(ofSize: 15, weight: .light)
        commentTextField.textColor = UIColor.black
        commentTextField.backgroundColor = UIColor.systemGray5
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.borderColor = UIColor.systemGray5.cgColor
        commentTextField.layer.cornerRadius = 20
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        commentTextField.leftView = paddingView
        commentTextField.leftViewMode = .always
        view.addSubview(commentTextField)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.autocorrectionType = .no
        commentTextField.autocapitalizationType = .none
        
        
        setUpConstraints()
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 50)
        ])


        NSLayoutConstraint.activate([
            commentTitleTextField.topAnchor.constraint(equalTo: headerLabel
                .bottomAnchor, constant: 30),
            commentTitleTextField.heightAnchor.constraint(equalToConstant: 30),
            commentTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            commentTextField.topAnchor.constraint(equalTo: commentTitleTextField
                .bottomAnchor, constant: 10),
            commentTextField.heightAnchor.constraint(equalToConstant: 50),
            commentTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            commentTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )

        
                
        
    }
    
    
    @objc func changeFieldsAndDismiss(){
        // TODO network manager stuff to add comment
        NetworkManager.getUser(id: user_id) {user in
            NetworkManager.createCommentForPost(body: self.commentTextField.text!, user_id: self.user_id, post_id: self.post_id, session_token: user.session_token!){_ in
                
            }
        }
        navigationController?.popViewController(animated: true)
    }
}



