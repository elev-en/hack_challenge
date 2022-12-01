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
    let usernameTextField = UsernameTextField()
    let passwordTextField = PasswordTextField()
    let signInButton = UIButton()
    
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
        
        usernameTextField.placeholder = "Username"
        usernameTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.autocapitalizationType = UITextAutocapitalizationType.none
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        signInButton.layer.borderColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        signInButton.layer.borderWidth = 2
        signInButton.layer.cornerRadius = 5
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(pushEnterClassesViewController), for: .touchUpInside)
        view.addSubview(signInButton)
        
        setupConstraints()
    }
    
    @objc func pushEnterClassesViewController() {
        NetworkManager.userLogin(username: usernameTextField.text!, password: passwordTextField.text!) { response in
            print(response)
            self.navigationController?.pushViewController(TabBar(), animated: true)
            NetworkManager.userRenewSession(){_ in}
        }
            /*let alert = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: .alert)
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
            self.present(alert, animated: true, completion: nil)*/
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
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.bounds.height * 0.02),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            signInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
    }

}
