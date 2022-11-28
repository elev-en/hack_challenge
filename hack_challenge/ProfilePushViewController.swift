//
//  ProfilePushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

// view that has all the info about a persons profile, looks like personal profile with out the button to calender and no view post button


import UIKit

class ProfilePushViewController: UIViewController {
    
    let headerLabel = UILabel()
    var profileImageView = UIImageView()
    let nameYearTextLabel = UILabel()
    let numFriendsLabel = UILabel()
    let numPostsLabel = UILabel()
    let enrolledInLabel = UILabel()
    let bioTextField = UITextField()
    var courses: [Course] = []
    var lineView = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))

//    let FriendsReuseIdentifier: String = "FriendsReuseIdentifier"
//    var friendsCollectionView: UICollectionView!
//    let spacing: CGFloat = 10
    
    var profile: Profile!
    weak var delegate: ChangeProfileInfoDelegate?

    init(profile: Profile, delegate: ChangeProfileInfoDelegate?) {
        self.profile = profile
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        

        //title = "\(profile.name), \(profile.gradYear)"

        headerLabel.numberOfLines = 40
        headerLabel.backgroundColor = .systemGray6
        headerLabel.clipsToBounds = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        // fix profile image to use profile image
        profileImageView.image = UIImage(named: "Avatar 6")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.contentMode = .scaleAspectFit

        nameYearTextLabel.text = "\(profile.name), \(profile.gradYear)"
        nameYearTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameYearTextLabel.textColor = UIColor.black
        view.addSubview(nameYearTextLabel)
        nameYearTextLabel.isUserInteractionEnabled = false
        nameYearTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numFriendsLabel.text = "\(profile.friends.count) friends"
        numFriendsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        numFriendsLabel.textColor = UIColor.black
        view.addSubview(numFriendsLabel)
        numFriendsLabel.isUserInteractionEnabled = false
        numFriendsLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        let friendsLayout = UICollectionViewFlowLayout()
//        friendsLayout.minimumLineSpacing = spacing
//        friendsLayout.minimumInteritemSpacing = spacing
//        friendsLayout.scrollDirection = .horizontal
//
//        friendsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: friendsLayout)
//        friendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        friendsCollectionView.backgroundColor = UIColor.white
//        friendsCollectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: FriendsReuseIdentifier)
//        friendsCollectionView.dataSource = self
//        friendsCollectionView.delegate = self
        
        numPostsLabel.text = "\(profile.posts.count) posts"
        numPostsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        numPostsLabel.textColor = UIColor.black
        view.addSubview(numPostsLabel)
        numPostsLabel.isUserInteractionEnabled = false
        numPostsLabel.translatesAutoresizingMaskIntoConstraints = false


        bioTextField.text = "\(profile.bio)"
        bioTextField.font = .systemFont(ofSize: 14, weight: .regular)
        bioTextField.textColor = UIColor.purple
        bioTextField.isUserInteractionEnabled = false
        view.addSubview(bioTextField)
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        
//        lineView.layer.borderWidth = 1.0
//        lineView.layer.borderColor = UIColor.black.cgColor
//        self.view.addSubview(lineView)

        /* add courses collectionview?
        enrolledInLabel.text = "currently enrolled in"
        enrolledInLabel.font = .systemFont(ofSize: 15, weight: .bold)
        enrolledInLabel.textColor = UIColor.systemGray2
        enrolledInLabel.isUserInteractionEnabled = false
        view.addSubview(enrolledInLabel)
        enrolledInLabel.translatesAutoresizingMaskIntoConstraints = false
         
         */
        
        setUpConstraints()
        
    }
    
    func setUpConstraints(){
        
        let verticalPadding: CGFloat = 2
        let sidePadding: CGFloat = 2

        NSLayoutConstraint.activate([
            headerLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        //TODO change to multiplier
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: view.bounds.height * 0.02),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        NSLayoutConstraint.activate([
            nameYearTextLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: view.bounds.height * 0.02),
            nameYearTextLabel.heightAnchor.constraint(equalToConstant: 20),
            nameYearTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bioTextField.topAnchor.constraint(equalTo: nameYearTextLabel.bottomAnchor, constant: view.bounds.height * 0.0045),
            bioTextField.heightAnchor.constraint(equalToConstant: 20),
            bioTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            numFriendsLabel.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: view.bounds.height * 0.04),
            numFriendsLabel.heightAnchor.constraint(equalToConstant: 20),
            numFriendsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        NSLayoutConstraint.activate([
//            friendsCollectionView.topAnchor.constraint(equalTo: numFriendsLabel.bottomAnchor, constant: view.bounds.height * 0.0005),
//            friendsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -verticalPadding),
//            friendsCollectionView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: sidePadding),
//            friendsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
//
//        ])
        
        NSLayoutConstraint.activate([
            numPostsLabel.topAnchor.constraint(equalTo: numFriendsLabel.bottomAnchor, constant: view.bounds.height * 0.005),
            numPostsLabel.heightAnchor.constraint(equalToConstant: 30),
            numPostsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        
//        NSLayoutConstraint.activate([
//            lineView.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: view.bounds.height * 0.04),
//            lineView.heightAnchor.constraint(equalToConstant: 20),
//            lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
        
        
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//extension ProfilePushViewController: UICollectionViewDelegateFlowLayout {
//
//    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
//        return CGSize(width: collectionView.frame.width*0.5, height: collectionView.frame.height*0.15)
//    }*/
//
//    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return "String".size(withAttributes: nil)
//    }*/
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let profile = profile[indexPath.row]
//        return CGSize(width: profile.name.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]).width + 2, height: collectionView.frame.height*0.6)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//        return headerView
//    }
//}
//
//extension ProfileCollectionViewCell: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return profile.friends.count
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseReuseIdentifier, for: indexPath) as? FriendsCollectionViewCell{
//            cell.configure(profile: profile.friends[indexPath.row])
//            cell.backgroundColor = UIColor.white
//            //cell.layer.borderColor = UIColor.black.cgColor
//            cell.contentView.layer.borderColor = UIColor.clear.cgColor
//            //cell.layer.borderColor = UIColor.white.cgColor
//            //cell.layer.cornerRadius = 15
//            return cell
//        }
//        else{
//            return UICollectionViewCell()
//        }
//    }
//
//}


protocol ChangeProfileInfoDelegate: AnyObject {
    func changeProfileInfo(profile: Profile)
}
