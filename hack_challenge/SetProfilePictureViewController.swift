//
//  SetProfilePictureViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class SetProfilePictureViewController: UIViewController {

    let background = UIImageView()
    
    let changeProfilePicImageButton = UIButton()
    let changeProfilePicTextButton = UIButton()
    let finishChangingPicButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        changeProfilePicTextButton.setTitle("", for: .normal)
        changeProfilePicImageButton.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        changeProfilePicTextButton.layer.backgroundColor = UIColor.clear.cgColor
        changeProfilePicTextButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfilePicTextButton.addTarget(self, action: #selector(presentChangeProfilePicViewController), for: .touchUpInside)
        view.addSubview(changeProfilePicTextButton)
        
        changeProfilePicTextButton.setTitle("Change Profile Picture", for: .normal)
        changeProfilePicTextButton.layer.backgroundColor = UIColor.clear.cgColor
        changeProfilePicTextButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfilePicTextButton.addTarget(self, action: #selector(presentChangeProfilePicViewController), for: .touchUpInside)
        view.addSubview(changeProfilePicTextButton)
        
        
        
        
    }
    
    func setupConstraints(){
        
    }
    
    @objc func presentChangeProfilePicViewController(){
        present(ChangeProfilePicViewController(), animated: true, completion: nil)
    }

}
