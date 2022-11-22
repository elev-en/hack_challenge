//
//  CreateUsernamePassowordViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/21/22.
//

import UIKit

class CreateUsernamePasswordViewController: UIViewController {
    
    let background = UIImageView()
    let welcomeLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let usernameStackView = UIStackView()
    let passwordStackView = UIStackView()
    let confirmPasswordStackView = UIStackView()
   

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
        
        welcomeLabel.text = "Welcome to CUStudy!"
        welcomeLabel.font = .systemFont(ofSize: 25)
        welcomeLabel.adjustsFontForContentSizeCategory = true
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.bounds.width/10),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.1)
        ])
    }

}

