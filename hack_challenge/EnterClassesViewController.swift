//
//  EnterClassesViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/23/22.
//

import UIKit
import Lottie

class EnterClassesViewController: UIViewController {
    
    var user_id: Int
    let background = UIImageView()
    var bookAnimation = LottieAnimationView()
    let enterClassesLabel = UILabel()
    let enterClassInfoButton = UIButton()
    
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
        
        enterClassesLabel.text = "Tell the world \nabout your classes"
        enterClassesLabel.numberOfLines = 2
        enterClassesLabel.font = UIFont(name: "BodoniSvtyTwoITCTT-Bold", size: 37)
        enterClassesLabel.textAlignment = .left
        enterClassesLabel.textColor = UIColor(red: 0.32, green: 0.28, blue: 0.49, alpha: 1)
        enterClassesLabel.adjustsFontForContentSizeCategory = true
        enterClassesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterClassesLabel)
        
        bookAnimation = LottieAnimationView(name: "book")
        bookAnimation.frame = view.bounds
        bookAnimation.contentMode = .scaleAspectFill
        bookAnimation.loopMode = .loop
        bookAnimation.animationSpeed = 1
        bookAnimation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookAnimation)
        bookAnimation.play()
        
        enterClassInfoButton.setTitle("ENTER CLASS INFO", for: .normal)
        enterClassInfoButton.layer.backgroundColor = UIColor(red: 0.43, green: 0.39, blue: 0.68, alpha: 1.00).cgColor
        enterClassInfoButton.layer.borderWidth = 0
        enterClassInfoButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 15)
        enterClassInfoButton.layer.cornerRadius = 5
        enterClassInfoButton.translatesAutoresizingMaskIntoConstraints = false
        enterClassInfoButton.addTarget(self, action: #selector(pushAddClassesViewController), for: .touchUpInside)
        view.addSubview(enterClassInfoButton)
        
        setupConstraints()
        
    }
    
    @objc func pushAddClassesViewController() {
        navigationController?.pushViewController(AddClassesViewController(id: user_id), animated: true)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterClassesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterClassesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.1)
        ])
        
        NSLayoutConstraint.activate([
            bookAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bookAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            enterClassInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterClassInfoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            enterClassInfoButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            enterClassInfoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
}
