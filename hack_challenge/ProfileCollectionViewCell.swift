//
//  ProfileCollectionViewCell.swift
//  hack_challenge
//
//  Created by kaitlyn on 11/27/22.
//
 
import UIKit
 
class ProfileCollectionViewCell: UICollectionViewCell{
    
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let gradYearLabel = UILabel()
    let bioLabel = UILabel()
    var courses: [Course] = []
 
    let CourseReuseIdentifier: String = "CourseReuseIdentifier"
    var coursesCollectionView: UICollectionView!
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
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        //profileImageView.layer.masksToBounds = false
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 20)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        bioLabel.font = UIFont.systemFont(ofSize: 10)
        bioLabel.numberOfLines = 0
        bioLabel.textColor = UIColor.purple
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let courseLayout = UICollectionViewFlowLayout()
        courseLayout.minimumLineSpacing = spacing
        courseLayout.minimumInteritemSpacing = spacing
        courseLayout.scrollDirection = .horizontal
        
        coursesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: courseLayout)
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        coursesCollectionView.backgroundColor = UIColor.white
        coursesCollectionView.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: CourseReuseIdentifier)
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        
        
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
            bioLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: contentView.bounds.height * 0.05),
            bioLabel.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            coursesCollectionView.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: contentView.bounds.height * 0.6),
            coursesCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalPadding),
            coursesCollectionView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: sidePadding),
            coursesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
    
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
        //profileImageView.image = UIImage(named: profile.profileImage)
        bioLabel.text = profile.bio
        // profileImageView.image = profile.profileImage
        courses = profile.courses
    }
    
    
    
    
    
}
 
extension ProfileCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let course = courses[indexPath.row]
        return CGSize(width: course.name.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]).width + 2, height: collectionView.frame.height*0.6)
 
    }
    
 
    
 
    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
}
 
extension ProfileCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
 
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseReuseIdentifier, for: indexPath) as? CoursesCollectionViewCell{
            cell.configure(courseVar: courses[indexPath.row])
            cell.backgroundColor = UIColor.white
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.layer.cornerRadius = 15
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
 
}
