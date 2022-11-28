//
//  FriendsCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/27/22.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let gradYearLabel = UILabel()
    

    let stackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
    
    func setupViews(){
        //TODO change profile image to actual profile image
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 20)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        gradYearLabel.font = UIFont.systemFont(ofSize: 10)
        gradYearLabel.numberOfLines = 0
        gradYearLabel.textColor = UIColor.gray
        gradYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(profileName)
        stackView.addArrangedSubview(gradYearLabel)
        contentView.addSubview(stackView)
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 5.0
        let sidePadding: CGFloat = 5.0
        let profileImageDim: CGFloat = 10
        

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageDim),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageDim),
        ])
        
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: sidePadding),
        ])
        
        NSLayoutConstraint.activate([
            gradYearLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 5),
            gradYearLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: sidePadding),
        ])

        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(profile: Profile){
        profileName.text = "\(profile.name)"
        gradYearLabel.text = "\(profile.gradYear)"
    }
    
}
    

