//
//  PostCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/28/22.
//
 
import UIKit
 
class PostsCollectionViewCell: UICollectionViewCell {
    
    let profileImageView = UIImageView()
    var profileName = UILabel()
    let titleLabel = UILabel()
    let courseTextField = UITextField()
    let timeStamp = UILabel()
    let location = UILabel()
    let dateFormatter = DateFormatter()
        
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
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//
//    }
    
    func setupViews(){
        dateFormatter.dateFormat = "MM/dd/yyyy"
        //TODO change profile image to actual profile image
        profileImageView.image = UIImage(named: "among us")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        profileName.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileName)
 
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
 
        
        courseTextField.textAlignment = .center
        courseTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        courseTextField.translatesAutoresizingMaskIntoConstraints = false
        courseTextField.layer.masksToBounds = true
        courseTextField.layer.cornerRadius = 8.0
        courseTextField.backgroundColor = UIColor(red: 0.843, green: 0.855, blue: 0.988, alpha: 1.00)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        courseTextField.leftView = paddingView
        courseTextField.leftViewMode = .always
        courseTextField.rightView = paddingView
        courseTextField.rightViewMode = .always
        courseTextField.isUserInteractionEnabled = false
        contentView.addSubview(courseTextField)
 
        timeStamp.textAlignment = .left
        timeStamp.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timeStamp)
        
        location.textAlignment = .left
        location.font = UIFont.systemFont(ofSize: 10)
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
 
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 15
        let sidePadding: CGFloat = 20.0
 
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
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: contentView.bounds.width*0.04),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
        ])
        
        NSLayoutConstraint.activate([
            courseTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: contentView.bounds.height*0.067),
            courseTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: contentView.bounds.width*0.04)
 
        ])
        
        NSLayoutConstraint.activate([
            timeStamp.topAnchor.constraint(equalTo: courseTextField.bottomAnchor, constant: contentView.bounds.height*0.127),
            timeStamp.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: contentView.bounds.width*0.04),
            timeStamp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
        ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: timeStamp.bottomAnchor, constant: contentView.bounds.height*0.01),
            location.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: contentView.bounds.width*0.04),
            location.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
 
        ])
        
        
    
    }
    
    func configure(post: Post){
        NetworkManager.getUser(id: post.user_id){poster in
            var name = "\(poster.name ?? "")"
            if name != nil {
                if let index = name.firstIndex(of: " ") {
                    let firstName = String(name[..<index])
                    
                    self.profileName.text = firstName
                } else {
                    self.profileName.text = name
                }
            }
        }
        timeStamp.text = "wed, dec 1st, 5:00 pm"
        // profileImageView.image = post.poster.profileImage
        titleLabel.text = post.header
        //courseTextField.text = post.course.name
        location.text = post.location
    }
    
    
    
    
    
}
