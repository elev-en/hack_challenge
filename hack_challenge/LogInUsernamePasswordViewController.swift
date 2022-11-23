//
//  LogInUsernamePasswordViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/21/22.
//

import UIKit

class LogInUsernamePasswordViewController: UIViewController {

    let background = UIImageView()
    let welcomeBackLabel = UILabel()
    let usernameImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordImageView = UIImageView()
    let passwordTextField = UITextField()
    let usernameStackView = UIStackView()
    let passwordStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: view.bounds.width/10-view.bounds.width/5, y: view.bounds.height/10, width: view.bounds.width, height: view.bounds.height*0.25))

        let fillLayer = CAShapeLayer()
        fillLayer.path = ovalPath.cgPath
        fillLayer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        fillLayer.opacity = 0.5
        view.layer.addSublayer(fillLayer)
        
        welcomeBackLabel.text = "Welcome back to \nCUStudy!"
        welcomeBackLabel.numberOfLines = 2
        welcomeBackLabel.font = .systemFont(ofSize: 25)
        welcomeBackLabel.adjustsFontForContentSizeCategory = true
        welcomeBackLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeBackLabel)
        
        usernameImageView.image = UIImage(systemName: "person.crop.circle")
        usernameImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameImageView)
        
        usernameTextField.placeholder = "Username"
        usernameTextField.backgroundColor = UIColor.white
        view.addSubview(usernameTextField)
        
        passwordImageView.image = UIImage(systemName: "lock.open.fill")
        passwordImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordImageView)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor.white
        view.addSubview(passwordTextField)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeBackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.bounds.width/10),
            welcomeBackLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.08)
        ])
    }

}
