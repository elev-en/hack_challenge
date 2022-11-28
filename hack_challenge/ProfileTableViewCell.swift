//
//  ProfileTableViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/26/22.
//

// table view for profile - includes profile name, grad year, collection view of courses

import UIKit

class ProfileTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let gradYearLabel = UILabel()
    let bioLabel = UILabel()
    var courses: [Course] = []

    let spacing: CGFloat = 10
    let ProfileReuseIdentifier: String = "ProfileReuseIdentifier"
    
    
    var coursesCollectionView: UICollectionView!
    
    let stackView = UIStackView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func setupViews(){
        //TODO change profile image to actual profile image
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 20)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
//        gradYearLabel.font = UIFont.systemFont(ofSize: 10)
//        gradYearLabel.numberOfLines = 0
//        gradYearLabel.textColor = UIColor.purple
//        gradYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        bioLabel.numberOfLines = 0
        bioLabel.textColor = UIColor.purple
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let courseLayout = UICollectionViewFlowLayout()
        courseLayout.minimumLineSpacing = spacing
        courseLayout.minimumInteritemSpacing = spacing
        courseLayout.scrollDirection = .horizontal
        
        coursesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: courseLayout)
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        coursesCollectionView.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: ProfileReuseIdentifier)
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        coursesCollectionView.allowsMultipleSelection = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(profileName)
        stackView.addArrangedSubview(bioLabel)
        stackView.addArrangedSubview(coursesCollectionView)
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
            bioLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: contentView.bounds.height * 0.15),
            bioLabel.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
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
        bioLabel.text = profile.bio
        // profileImageView.image = profile.profileImage
        // gradYearLabel.text = "\(profile.gradYear)"
        courses = profile.courses
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileReuseIdentifier, for: indexPath) as? CoursesCollectionViewCell {
            cell.configure(courseVar: courses[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

