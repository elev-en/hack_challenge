//
//  SetProfileInfoViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class SetProfileInfoViewController: UIViewController {
    
    let bioLabel = UILabel()
    let bioTextField = UITextField()
    let gradLabel = UILabel()
    let gradTextField = UITextField()
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bioLabel.text = "Describe yourself using \none sentence"
        bioLabel.numberOfLines = 2
        bioLabel.font = .systemFont(ofSize: 30, weight: .bold)
        bioLabel.textAlignment = .left
        bioLabel.adjustsFontForContentSizeCategory = true
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        bioTextField.placeholder = ""
        bioTextField.font = .systemFont(ofSize: 20)
        bioTextField.textAlignment = .center
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextField)
        
        gradLabel.text = "What is your year of \n graduation?"
        gradLabel.numberOfLines = 2
        gradLabel.font = .systemFont(ofSize: 30, weight: .bold)
        gradLabel.textAlignment = .left
        gradLabel.adjustsFontForContentSizeCategory = true
        gradLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradLabel)
        
        gradTextField.placeholder = "yyyy"
        gradTextField.font = .systemFont(ofSize: 20)
        gradTextField.textAlignment = .center
        gradTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextField)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        nextButton.layer.borderWidth = 2
        nextButton.layer.cornerRadius = 5
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        //nextButton.addTarget(self, action: #selector(addClasses), for: .touchUpInside)
        view.addSubview(nextButton)
        
        
    }

}
