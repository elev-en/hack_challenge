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

    
    var profile: Profile!
    weak var delegate: ChangeProfileInfoDelegate?

    init(profile: Profile, delegate: ChangeProfileInfoDelegate?) {
        self.profile = profile
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "\(profile.name), \(profile.gradYear)"

        headerLabel.numberOfLines = 40
        headerLabel.backgroundColor = .systemGray6
        headerLabel.clipsToBounds = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        // fix profile image to use profile image
        profileImageView.image = UIImage(named: "Avatar 1")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.contentMode = .scaleAspectFit

        /*nameYearTextLabel.text = "name, year"
        nameYearTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameYearTextLabel.textColor = UIColor.black
        view.addSubview(nameYearTextLabel)
        nameYearTextLabel.isUserInteractionEnabled = false
        nameYearTextLabel.translatesAutoresizingMaskIntoConstraints = false*/
        
        numFriendsLabel.text = "\(profile.friends.count) friends"
        numFriendsLabel.font = .systemFont(ofSize: 20, weight: .bold)
        numFriendsLabel.textColor = UIColor.black
        view.addSubview(numFriendsLabel)
        numFriendsLabel.isUserInteractionEnabled = false
        numFriendsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numPostsLabel.text = "\(profile.posts.count) posts"
        numPostsLabel.font = .systemFont(ofSize: 20, weight: .bold)
        numPostsLabel.textColor = UIColor.black
        view.addSubview(numPostsLabel)
        numPostsLabel.isUserInteractionEnabled = false
        numPostsLabel.translatesAutoresizingMaskIntoConstraints = false


        bioTextField.text = "\(profile.bio)"
        bioTextField.font = .systemFont(ofSize: 20, weight: .regular)
        bioTextField.textColor = UIColor.black
        bioTextField.isUserInteractionEnabled = false
        view.addSubview(bioTextField)
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(lineView)

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
            numFriendsLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: view.bounds.height * 0.03),
            numFriendsLabel.heightAnchor.constraint(equalToConstant: 20),
            numFriendsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numPostsLabel.topAnchor.constraint(equalTo: numFriendsLabel.bottomAnchor, constant: view.bounds.height * 0.02),
            numPostsLabel.heightAnchor.constraint(equalToConstant: 30),
            numPostsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bioTextField.topAnchor.constraint(equalTo: numPostsLabel.bottomAnchor, constant: view.bounds.height * 0.04),
            bioTextField.heightAnchor.constraint(equalToConstant: 20),
            bioTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: view.bounds.height * 0.04),
            lineView.heightAnchor.constraint(equalToConstant: 20),
            lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

protocol ChangeProfileInfoDelegate: AnyObject {
    func changeProfileInfo(profile: Profile)
}
