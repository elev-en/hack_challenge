//
//  SetProfilePictureViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class SetProfilePictureViewController: UIViewController {

    let background = UIImageView()
    let defaultImage = UIImage(named: "default")
    let changeProfilePicImageButton = UIButton()
    let changeProfilePicTextButton = UIButton()
    let finishChangingPicButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        changeProfilePicImageButton.setTitle("", for: .normal)
        changeProfilePicImageButton.setImage(defaultImage, for: .normal)
        changeProfilePicImageButton.layer.cornerRadius = changeProfilePicImageButton.bounds.width/2
        changeProfilePicImageButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfilePicImageButton.addTarget(self, action: #selector(presentChangeProfilePicViewController), for: .touchUpInside)
        view.addSubview(changeProfilePicImageButton)
        
        changeProfilePicTextButton.setTitle("Change Profile Picture", for: .normal)
        changeProfilePicTextButton.layer.backgroundColor = UIColor.clear.cgColor
        changeProfilePicTextButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfilePicTextButton.addTarget(self, action: #selector(presentChangeProfilePicViewController), for: .touchUpInside)
        view.addSubview(changeProfilePicTextButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            changeProfilePicImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeProfilePicImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height*0.05),
        ])
        
        NSLayoutConstraint.activate([
            changeProfilePicTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeProfilePicTextButton.topAnchor.constraint(equalTo: changeProfilePicImageButton.bottomAnchor),
            changeProfilePicTextButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            changeProfilePicTextButton.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
    }
    
    @objc func presentChangeProfilePicViewController(){
        present(ChangeProfilePicViewController(), animated: true, completion: nil)
    }

}
