//
//  ProfileCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/27/22.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell{
    
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let header = UILabel()
    let body = UILabel()
    let timestamp = UILabel()
    
    let spacing: CGFloat = 10

    
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
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 12)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        body.textAlignment = .left
        body.font = UIFont.systemFont(ofSize: 10)
        body.numberOfLines = 2
        body.textColor = UIColor.purple
        body.translatesAutoresizingMaskIntoConstraints = false
        
        
        header.font = UIFont.systemFont(ofSize: 18)
        header.textAlignment = .left
        header.textColor = UIColor.black
        header.translatesAutoresizingMaskIntoConstraints = false
        
        
        timestamp.font = UIFont.systemFont(ofSize: 10)
        timestamp.textAlignment = .left
        timestamp.textColor = UIColor.gray
        timestamp.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(profileName)
        stackView.addArrangedSubview(header)
        stackView.addArrangedSubview(body)
        stackView.addArrangedSubview(timestamp)
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
            header.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: contentView.bounds.height * 0.05),
            header.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: header.bottomAnchor, constant: contentView.bounds.height * 0.05),
            body.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timestamp.topAnchor.constraint(equalTo: body.bottomAnchor, constant: contentView.bounds.height * 0.05),
            timestamp.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(post: Post){
        profileName.text = "\(post.poster.name)"
        header.text = post.header
        body.text = post.body
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
//        let timeStamp = dateFormatter.date(from: post.timeStamp)!
//
//        let coolDateFormatter = DateFormatter()
//        coolDateFormatter.dateFormat = "MMM d, h:mm a"
//        let coolDateString = coolDateFormatter.string(from: timeStamp)
//        timestamp.text = "\(coolDateString)"
        
        timestamp.text = post.timeStamp

    }
    
    
    
    
    
}


