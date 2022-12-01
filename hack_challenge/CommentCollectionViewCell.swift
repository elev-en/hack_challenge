//
//  ProfileCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/27/22.
//
 
import UIKit
 
class CommentCollectionViewCell: UICollectionViewCell{
    
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let text = UILabel()
   
    
    let stackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        //TODO change profile image to actual profile image
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        //profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 20)
        profileName.translatesAutoresizingMaskIntoConstraints = false
    
        
        text.font = UIFont.systemFont(ofSize: 10)
        text.numberOfLines = 0
        text.textColor = UIColor.purple
        text.translatesAutoresizingMaskIntoConstraints = false
        
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(profileName)
        stackView.addArrangedSubview(text)
        contentView.addSubview(stackView)
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 20.0
        let sidePadding: CGFloat = 20.0
        let profileImageDim: CGFloat = 40
        
 
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
            text.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: contentView.bounds.height * 0.05),
            text.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(comment: Comment){
        profileName.text = "\(comment.commenter.name)"
        //profileImageView.image = UIImage(named: comment.commenter.profileImage)
        text.text = comment.body
    }
    
    
    
    
    
}
 
