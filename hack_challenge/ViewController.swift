//
//  ViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/15/22.
//

import UIKit
import Lottie

class ViewController: UIViewController{
    
    let appNameLabel = UILabel()
    var studyAnimation = LottieAnimationView()
    let logInButton = UIButton()
    let createAccountButton = UIButton()

    //login in
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.75, green: 0.77, blue: 0.98, alpha: 1.00)
        
        appNameLabel.text = "CUStudy"
        appNameLabel.textColor = .white
        appNameLabel.font = UIFont(name: "Courier-Bold", size: 60)
        appNameLabel.adjustsFontForContentSizeCategory = true
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appNameLabel)
        
        studyAnimation = LottieAnimationView(name: "study")
        studyAnimation.frame = view.bounds
        studyAnimation.contentMode = .scaleAspectFill
        studyAnimation.loopMode = .loop
        studyAnimation.animationSpeed = 1
        studyAnimation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(studyAnimation)
        studyAnimation.play()
        
        let hover = UIHoverGestureRecognizer(target: self, action: #selector(hovering(_:)))
        
        
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00), for: .normal)
        createAccountButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        createAccountButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        createAccountButton.layer.borderColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        createAccountButton.layer.borderWidth = 2
        createAccountButton.layer.cornerRadius = 5
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(pushCreateAccountViewController), for: .touchUpInside)
        createAccountButton.addGestureRecognizer(hover)
        view.addSubview(createAccountButton)
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00), for: .normal)
        logInButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        logInButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        logInButton.layer.borderColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        logInButton.layer.borderWidth = 2
        logInButton.layer.cornerRadius = 5
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(pushLogInViewController), for: .touchUpInside)
        view.addSubview(logInButton)
        
        setupConstraints()
        
    }
    
    @objc func pushCreateAccountViewController() {
        navigationController?.pushViewController(CreateUsernamePasswordViewController(), animated: true)
    }
    
    @objc func hovering(_ recognizer: UIHoverGestureRecognizer) {
            switch recognizer.state {
            case .began, .changed:
                createAccountButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
            case .ended:
                createAccountButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
            default:
                break
            }
        }
    
    @objc func pushLogInViewController() {
        //navigationController?.pushViewController(LogInUsernamePasswordViewController(inputDelegate: PersonalProfileViewController()), animated: true)
        //navigationController?.pushViewController(ProfileSearchPushViewController(), animated: true)
        //navigationController?.pushViewController(PostSearchPushViewController(), animated: true)
        navigationController?.pushViewController(ExploreViewController(id:1), animated: true)


    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            studyAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studyAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height*0.035),
            studyAnimation.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            studyAnimation.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: studyAnimation.bottomAnchor, constant: -view.bounds.height*0.05),
            createAccountButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            createAccountButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: view.bounds.height*0.05),
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
    }


}

