//
//  CommentCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/27/22.
//
 
import UIKit
 
class CommentCollectionViewCell: UICollectionViewCell{
    
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let text = CommentTextField()
   
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)

 
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        profileName.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileName)
        
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        text.isUserInteractionEnabled = false
        text.font = UIFont.systemFont(ofSize: 12)
        text.backgroundColor = UIColor.white
        text.textColor = UIColor.black
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 1
        text.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(text)

        
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 20.0
        let sidePadding: CGFloat = 0.2
        let profileImageDim: CGFloat = 40
        
 
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            profileImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.6),
            profileImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.height * 0.6),
        ])
        
        
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            profileName.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            text.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: contentView.bounds.width*0.04),
            text.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -contentView.bounds.width*0.02),
            text.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -contentView.bounds.width*0.01)
        ])
        
    
    }
    
    func configure(comment: Comment){
        NetworkManager.getUser(id: comment.user_id){commenter in
            var name = "\(commenter.name ?? "")"
            let index = name.firstIndex(of: " ")!
            let firstName = String(name[..<index])
            
            self.profileName.text = firstName
        }
        
        //profileName.text = firstName
        profileImageView.image = UIImage(named: "smiley face")
        //profileImageView.image = UIImage(named: comment.commenter.profileImage)
        text.text = comment.body
    }
    
    
    
    
    
}
 
