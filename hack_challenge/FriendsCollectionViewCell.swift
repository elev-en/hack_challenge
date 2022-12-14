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
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 0.843, green: 0.855, blue: 0.988, alpha: 1.00)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        //TODO change profile image to actual profile image
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 13)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileName)
 
        
//        gradYearLabel.font = UIFont.systemFont(ofSize: 10)
//        gradYearLabel.numberOfLines = 0
//        gradYearLabel.textColor = UIColor.gray
//        gradYearLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(gradYearLabel)
 
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 5.0
        let sidePadding: CGFloat = 5.0
        let profileImageDim: CGFloat = 30
        
 
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageDim),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageDim),
        ])
        
        NSLayoutConstraint.activate([
            profileName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: sidePadding),
        ])
        
 
    
    }
    
    func configure(friend: Profile){
        var name = "\(friend.name ?? "")"
        profileName.text = name
        profileImageView.image = UIImage(named: friend.picture_id!)
    }
    
}
    
