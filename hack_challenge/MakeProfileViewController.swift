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
    let user_id: Int
    var lightbulbAnimation = LottieAnimationView()
    let makeProfileLabel = UILabel()
    let makeProfileButton = UIButton()
    
    init(id: Int){
        self.user_id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true


        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        makeProfileLabel.text = "Make your profile \nsparkle!"
        makeProfileLabel.numberOfLines = 2
        makeProfileLabel.font = UIFont(name: "BodoniSvtyTwoITCTT-Bold", size: 37)
        makeProfileLabel.textColor = UIColor(red: 0.32, green: 0.28, blue: 0.49, alpha: 1)
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
        
        makeProfileButton.setTitle("MAKE PROFILE", for: .normal)
        makeProfileButton.layer.backgroundColor = UIColor(red: 0.43, green: 0.39, blue: 0.68, alpha: 1.00).cgColor
        makeProfileButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 15)
        makeProfileButton.layer.borderWidth = 0
        makeProfileButton.layer.cornerRadius = 5
        makeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        makeProfileButton.addTarget(self, action: #selector(pushSetProfileInfoViewController), for: .touchUpInside)
        view.addSubview(makeProfileButton)
        
        setupConstraints()
        
    }
    
    @objc func pushSetProfileInfoViewController() {
        navigationController?.pushViewController(SetProfileInfoViewController(id: user_id), animated: true)
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
            makeProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            makeProfileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            makeProfileButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            makeProfileButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }

}
