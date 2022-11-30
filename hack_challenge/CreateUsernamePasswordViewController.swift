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
    let usernameTextField = UsernameTextField()
    let passwordTextField = PasswordTextField()
    let confirmPasswordTextField = UITextField()
    let signUpButton = UIButton()
   

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
        
        usernameTextField.placeholder = "Username"
        usernameTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        confirmPasswordTextField.layer.cornerRadius = 5
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmPasswordTextField)
        
        signUpButton.setTitle("Create Account", for: .normal)
        signUpButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        signUpButton.layer.borderColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.cornerRadius = 5
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector(pushEnterClassesViewController), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        setupConstraints()
    }
    
    @objc func pushEnterClassesViewController() {
        if usernameTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please make sure all fields are entered.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        } else if(passwordTextField.text == confirmPasswordTextField.text){
            NetworkManager.createUser(username: usernameTextField.text!, password: passwordTextField.text!) {_ in }
            navigationController?.pushViewController(EnterClassesViewController(), animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Passwords do not match. Please make sure the passwords entered are the same.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
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
    
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height*0.05),
            usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            usernameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: view.bounds.height*0.02),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            passwordTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: view.bounds.height*0.02),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            passwordTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            confirmPasswordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            confirmPasswordTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: view.bounds.height * 0.02),
            signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            signUpButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
    }

}
