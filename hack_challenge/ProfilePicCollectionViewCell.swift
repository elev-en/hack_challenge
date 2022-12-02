//
//  ProfilePicCollectionViewCell.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/27/22.
//

import UIKit

class ProfilePicCollectionViewCell: UICollectionViewCell {
    var profileImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        setupConstraints()
    }
     
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(profilePic: ProfileImage) {
        profileImageView.image = profilePic.image
        print(profilePic)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
