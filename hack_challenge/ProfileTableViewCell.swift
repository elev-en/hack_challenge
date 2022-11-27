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
        
        gradYearLabel.font = UIFont.systemFont(ofSize: 10)
        gradYearLabel.numberOfLines = 0
        gradYearLabel.textColor = UIColor.purple
        gradYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var courseLayout = UICollectionViewFlowLayout()
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
        stackView.addArrangedSubview(gradYearLabel)
        stackView.addArrangedSubview(coursesCollectionView)
        contentView.addSubview(stackView)
    }
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 20.0
        let sidePadding: CGFloat = 20.0
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(profile: Profile){
        profileName.text = profile.name
        // profileImageView.image = profile.profileImage
        gradYearLabel.text = "\(profile.gradYear)"
        courses = profile.courses
        profileName.text = profile.name
        profileName.text = profile.name
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

