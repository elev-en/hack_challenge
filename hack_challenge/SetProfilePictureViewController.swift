//
//  SetProfilePictureViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class SetProfilePictureViewController: UIViewController, ChangeImageDelegate {

    let background = UIImageView()
    let user_id: Int
    let defaultImage = UIImage(named: "default")
    let changeProfilePicImageButton = UIButton()
    let changeProfilePicTextButton = UIButton()
    let finishChangingPicButton = UIButton()
    
    func changeImage(outputImage: UIImage) {
        print("changeImage called")
        changeProfilePicImageButton.setImage(outputImage, for: UIControl.State.normal)
        
    }
    
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
        
        changeProfilePicImageButton.setTitle("", for: .normal)
        changeProfilePicImageButton.setImage(defaultImage, for: .normal)
        changeProfilePicImageButton.layer.cornerRadius = 5
        changeProfilePicImageButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfilePicImageButton.addTarget(self, action: #selector(presentChangeProfilePicViewController), for: .touchUpInside)
        view.addSubview(changeProfilePicImageButton)
        
        changeProfilePicTextButton.setTitle("Change Profile Picture", for: .normal)
        changeProfilePicTextButton.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        finishChangingPicButton.layer.cornerRadius = 5
        changeProfilePicTextButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfilePicTextButton.addTarget(self, action: #selector(presentChangeProfilePicViewController), for: .touchUpInside)
        view.addSubview(changeProfilePicTextButton)
        
        finishChangingPicButton.setTitle("Finish Creating Account", for: .normal)
        finishChangingPicButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        finishChangingPicButton.layer.borderWidth = 2
        finishChangingPicButton.layer.cornerRadius = 5
        finishChangingPicButton.translatesAutoresizingMaskIntoConstraints = false
        finishChangingPicButton.addTarget(self, action: #selector(pushPersonalProfileViewController), for: .touchUpInside)
        view.addSubview(finishChangingPicButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            changeProfilePicImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeProfilePicImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height*0.05),
            changeProfilePicImageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            changeProfilePicImageButton.heightAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.75)
        ])
        
        NSLayoutConstraint.activate([
            changeProfilePicTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeProfilePicTextButton.topAnchor.constraint(equalTo: changeProfilePicImageButton.bottomAnchor, constant: view.bounds.height*0.02),
            changeProfilePicTextButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            finishChangingPicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishChangingPicButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            finishChangingPicButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            finishChangingPicButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
    }
    
    @objc func pushPersonalProfileViewController(){
        navigationController?.pushViewController(TabBar(id: user_id), animated: true)
    }
    
    @objc func presentChangeProfilePicViewController(){
        present(ChangeProfilePicViewController(inputDelegate: self, inputImage: (changeProfilePicImageButton.currentImage ??  UIImage(named: "default"))!), animated: true, completion: nil)
    }

}
