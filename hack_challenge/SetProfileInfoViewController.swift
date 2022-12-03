//
//  SetProfileInfoViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class SetProfileInfoViewController: UIViewController{
    
    
    
    var user_id: Int
    let background = UIImageView()
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let bioLabel = UILabel()
    let bioTextField = UITextField()
    let gradLabel = UILabel()
    let gradTextField = UITextField()
    let numberLabel = UILabel()
    let numberTextField = UITextField()
    let nextButton = UIButton()
    
    init(id: Int){
        self.user_id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        nameLabel.text = "Enter your name"
        nameLabel.numberOfLines = 2
        nameLabel.textColor = UIColor(red: 0.32, green: 0.28, blue: 0.49, alpha: 1)
        nameLabel.font = UIFont(name: "Avenir-Light", size: 20)
        nameLabel.textAlignment = .left
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameTextField.placeholder = "Name"
        nameTextField.font = .systemFont(ofSize: 20)
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        nameTextField.layer.cornerRadius = 5
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        view.addSubview(nameTextField)
        
        bioLabel.text = "Describe yourself using \none sentence"
        bioLabel.numberOfLines = 2
        bioLabel.textColor = UIColor(red: 0.32, green: 0.28, blue: 0.49, alpha: 1)
        bioLabel.font = UIFont(name: "Avenir-Light", size: 20)
        bioLabel.textAlignment = .left
        bioLabel.adjustsFontForContentSizeCategory = true
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        bioTextField.placeholder = ""
        bioTextField.font = .systemFont(ofSize: 20)
        bioTextField.textAlignment = .center
        bioTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        bioTextField.layer.cornerRadius = 5
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        bioTextField.autocorrectionType = .no
        bioTextField.autocapitalizationType = .none
        view.addSubview(bioTextField)
        
        gradLabel.text = "What is your year of \n graduation?"
        gradLabel.numberOfLines = 2
        gradLabel.textColor = UIColor(red: 0.32, green: 0.28, blue: 0.49, alpha: 1)
        gradLabel.font = UIFont(name: "Avenir-Light", size: 20)
        gradLabel.textAlignment = .left
        gradLabel.adjustsFontForContentSizeCategory = true
        gradLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradLabel)
        
        gradTextField.placeholder = "yyyy"
        gradTextField.font = .systemFont(ofSize: 20)
        gradTextField.textAlignment = .center
        gradTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        gradTextField.layer.cornerRadius = 5
        gradTextField.translatesAutoresizingMaskIntoConstraints = false
        gradTextField.autocorrectionType = .no
        gradTextField.autocapitalizationType = .none
        gradTextField.autocorrectionType = .no
        gradTextField.autocapitalizationType = .none
        view.addSubview(gradTextField)
        
        numberLabel.text = "Please enter your phone \nnumber"
        numberLabel.numberOfLines = 2
        numberLabel.font = UIFont(name: "Avenir-Light", size: 20)
        numberLabel.textColor = UIColor(red: 0.32, green: 0.28, blue: 0.49, alpha: 1)
        numberLabel.textAlignment = .left
        numberLabel.adjustsFontForContentSizeCategory = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(numberLabel)
        
        numberTextField.placeholder = "##########"
        numberTextField.font = .systemFont(ofSize: 20)
        numberTextField.textAlignment = .center
        numberTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        numberTextField.layer.cornerRadius = 5
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.autocorrectionType = .no
        numberTextField.autocapitalizationType = .none
        numberTextField.autocorrectionType = .no
        numberTextField.autocapitalizationType = .none
        view.addSubview(numberTextField)
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        nextButton.layer.borderWidth = 0
        nextButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 15)
        nextButton.layer.cornerRadius = 5
        nextButton.layer.backgroundColor = UIColor(red: 0.43, green: 0.39, blue: 0.68, alpha: 1.00).cgColor
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(pushSetProfilePicViewController), for: .touchUpInside)
        view.addSubview(nextButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.03),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: view.bounds.height*0.03),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            nameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: view.bounds.height*0.05),
            bioLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            bioTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bioTextField.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: view.bounds.height*0.03),
            bioTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            bioTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            gradLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gradLabel.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: view.bounds.height*0.05),
            gradLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            gradTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gradTextField.topAnchor.constraint(equalTo: gradLabel.bottomAnchor, constant: view.bounds.height*0.03),
            gradTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            gradTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.topAnchor.constraint(equalTo: gradTextField.bottomAnchor, constant: view.bounds.height*0.05),
            numberLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberTextField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: view.bounds.height*0.03),
            numberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            numberTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    func getDigits(num: Int) -> Int{
        var count = 0
        var n = num
        while n > 0 {
            n /= 10
            count += 1
        }
        return count
        
    }
    
    @objc func pushSetProfilePicViewController(){
        let gradYear = Int(gradTextField.text ?? "") ?? 2026
        let digits = getDigits(num: gradYear)
        if bioTextField.text != "" && digits == 4 && numberTextField.text != "" {
            NetworkManager.updateUser(id: user_id, name: nameTextField.text!, bio: bioTextField.text!, grad_year: gradYear, number: numberTextField.text!) {response in
                print(response)
            }
            navigationController?.pushViewController(SetProfilePictureViewController(id: user_id), animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please check that all fields are filled and correctly formatted.", preferredStyle: .alert)
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

}
                                         
