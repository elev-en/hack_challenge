//
//  MakeProfileViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit
import Lottie

class MakeProfileViewController: UIViewController {

    let background = UIImageView()
    var lightbulbAnimation = LottieAnimationView()
    let makeProfileLabel = UILabel()
    let enterClassInfoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        makeProfileLabel.text = "Make your profile \nsparkle!"
        makeProfileLabel.numberOfLines = 2
        makeProfileLabel.font = .systemFont(ofSize: 30, weight: .bold)
        makeProfileLabel.textAlignment = .left
        makeProfileLabel.adjustsFontForContentSizeCategory = true
        makeProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(makeProfileLabel)
        
        lightbulbAnimation = LottieAnimationView(name: "book")
        lightbulbAnimation.frame = view.bounds
        lightbulbAnimation.contentMode = .scaleAspectFill
        lightbulbAnimation.loopMode = .loop
        lightbulbAnimation.animationSpeed = 1
        lightbulbAnimation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lightbulbAnimation)
        lightbulbAnimation.play()
        
        enterClassInfoButton.setTitle("Enter Class Info", for: .normal)
        enterClassInfoButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        enterClassInfoButton.layer.borderWidth = 2
        enterClassInfoButton.layer.cornerRadius = 5
        enterClassInfoButton.translatesAutoresizingMaskIntoConstraints = false
        enterClassInfoButton.addTarget(self, action: #selector(pushAddClassesViewController), for: .touchUpInside)
        view.addSubview(enterClassInfoButton)
        
        setupConstraints()
        
    }
    
    @objc func pushAddClassesViewController() {
        navigationController?.pushViewController(SetProfileInfoViewController(), animated: true)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            makeProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            makeProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            lightbulbAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lightbulbAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterClassInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterClassInfoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            enterClassInfoButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            enterClassInfoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }

}
