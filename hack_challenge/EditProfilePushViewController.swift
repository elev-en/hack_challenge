//
//  EditProfilePushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class EditProfilePushViewController: UIViewController {
    
    var user_id: Int
    var profileImageView = UIButton()
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
        
        view.backgroundColor = UIColor(red: 0.75, green: 0.77, blue: 0.98, alpha: 1.00)
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.addTarget(self, action: #selector(pushSetProfilePictureViewController), for: .touchUpInside)
        
        nameLabel.text = "Enter your name"
        nameLabel.numberOfLines = 2
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
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
        bioLabel.font = .systemFont(ofSize: 20, weight: .bold)
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
        gradLabel.font = .systemFont(ofSize: 20, weight: .bold)
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
        
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        nextButton.layer.borderWidth = 2
        nextButton.layer.cornerRadius = 5
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        view.addSubview(nextButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * 0.02),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: view.bounds.height*0.15)
            
        ])
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: view.bounds.height*0.05),
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
    
    @objc func pushSetProfilePictureViewController(){
        navigationController?.pushViewController(SetProfilePictureViewController(id: user_id), animated: true)
    }
    
    @objc func save(){
        let gradYear = Int(gradTextField.text ?? "") ?? 0
        let digits = getDigits(num: gradYear)
        if bioTextField.text != "" && digits == 4 {
            NetworkManager.updateUser(id: user_id, name: nameTextField.text!, bio: bioTextField.text!, grad_year: gradYear, number: numberTextField.text!) {response in
                print(response)
            }
            self.dismiss(animated: true)
        } else if bioTextField.text == "" && digits != 4 {
            let alert = UIAlertController(title: "Error", message: "Please write a short bio and enter your year of graduation in the right format.", preferredStyle: .alert)
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
        } else if bioTextField.text == "" && digits == 4 {
            let alert = UIAlertController(title: "Error", message: "Please write a short bio.", preferredStyle: .alert)
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
        } else if bioTextField.text != "" && digits != 4 {
            let alert = UIAlertController(title: "Error", message: "Please enter year of graduation in the correct format.", preferredStyle: .alert)
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
