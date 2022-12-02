//
//  PersonalProfileViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class PersonalProfileViewController: UIViewController{
    

    // view of your own profile
    // push controller to your calender
    // push controller to your posts
    
    let user_id: Int
    let headerLabel = UILabel()
    var logoutButton = UIBarButtonItem()
    var editButton = UIBarButtonItem()
    var profileImageView = UIImageView()
    let nameYearTextLabel = UILabel()
    let coursesLabel = UILabel()
    let numFriendsLabel = UILabel()
    let numPostsLabel = UILabel()
    let enrolledInLabel = UILabel()
    let bioTextField = UITextField()
    var courses: [Course] = []
    var friends: [Profile] = []
    var friends_profiles: [Profile] = []
    var posts: [Post] = []
    var lineView = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
 
    let FriendsReuseIdentifier: String = "FriendsReuseIdentifier"
    var friendsCollectionView: UICollectionView!
    let spacing: CGFloat = 10
    
    let PostsReuseIdentifier: String = "PostsReuseIdentifier"
    var postsCollectionView: UICollectionView!
    
    let CoursesReuseIdentifier: String = "CoursesReuseIdentifier"
    var coursesCollectionView: UICollectionView!
    
    var profile: Profile?
    
    init(id: Int){
        self.user_id = id
        super.init(nibName: nil, bundle: nil)
        
        NetworkManager.getUser(id: user_id) {user in
            self.profile = user
            print("got user")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        
        for friend in friends {
            NetworkManager.getUser(id: friend.id) {user in
                self.friends_profiles.append(user)
            }
        }
        
        title = ""
 
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
 
 
        headerLabel.numberOfLines = 40
        headerLabel.backgroundColor = .systemGray6
        headerLabel.clipsToBounds = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        editButton.title = "   edit"
        editButton.target = self
        editButton.action = #selector(edit)
        self.navigationItem.leftBarButtonItem = editButton
        
        logoutButton.title = "logout   "
        logoutButton.target = self
        logoutButton.action = #selector(logout_button)
        self.navigationItem.rightBarButtonItem = logoutButton

        
        // fix profile image to use profile image
        profileImageView.image = UIImage(named: profile!.picture_id!)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.contentMode = .scaleAspectFit
 
        nameYearTextLabel.text = "\(profile!.name), \(profile!.grad_year)"
        nameYearTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameYearTextLabel.textColor = UIColor.black
        view.addSubview(nameYearTextLabel)
        nameYearTextLabel.isUserInteractionEnabled = false
        nameYearTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coursesLabel.text = "courses"
        coursesLabel.font = .systemFont(ofSize: 14, weight: .regular)
        coursesLabel.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        view.addSubview(coursesLabel)
        coursesLabel.isUserInteractionEnabled = false
        coursesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let courseLayout = UICollectionViewFlowLayout()
        courseLayout.minimumLineSpacing = spacing
        courseLayout.minimumInteritemSpacing = spacing
        courseLayout.scrollDirection = .horizontal
        
        courses = profile!.courses!
        coursesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: courseLayout)
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        coursesCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        coursesCollectionView.register(CoursesForProflePushCollectionViewCell.self, forCellWithReuseIdentifier: CoursesReuseIdentifier)
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        coursesCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(coursesCollectionView)
        
        if(profile!.friends!.count == 1){
            numFriendsLabel.text = "\(profile!.friends!.count) friend"
        }
        else{
            numFriendsLabel.text = "\(profile!.friends!.count) friends"
        }
        numFriendsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        numFriendsLabel.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        view.addSubview(numFriendsLabel)
        numFriendsLabel.isUserInteractionEnabled = false
        numFriendsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let friendsLayout = UICollectionViewFlowLayout()
        friendsLayout.minimumLineSpacing = spacing
        friendsLayout.minimumInteritemSpacing = spacing
        friendsLayout.scrollDirection = .horizontal
        
        friends = profile!.friends!
        friendsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: friendsLayout)
        friendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        friendsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        friendsCollectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: FriendsReuseIdentifier)
        friendsCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        friendsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(friendsCollectionView)
        
        numPostsLabel.text = "\(profile!.posts!.count) posts"
        numPostsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        numPostsLabel.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        view.addSubview(numPostsLabel)
        numPostsLabel.isUserInteractionEnabled = false
        numPostsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let postsLayout = UICollectionViewFlowLayout()
        postsLayout.minimumLineSpacing = spacing
        postsLayout.minimumInteritemSpacing = spacing
        postsLayout.scrollDirection = .vertical
        
        posts = profile!.posts!
        postsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: postsLayout)
        postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        postsCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: PostsReuseIdentifier)
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        postsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(postsCollectionView)
        
 
        bioTextField.text = "\(profile!.bio)"
        bioTextField.font = .systemFont(ofSize: 14, weight: .regular)
        bioTextField.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        bioTextField.isUserInteractionEnabled = false
        view.addSubview(bioTextField)
        bioTextField.translatesAutoresizingMaskIntoConstraints = false

        
        setUpConstraints()
        
    }
    
    func setUpConstraints(){
        
        let verticalPadding: CGFloat = 2
        let sidePadding: CGFloat = 20
 
        NSLayoutConstraint.activate([
            headerLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        //TODO change to multiplier
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: view.bounds.height * 0.02),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: view.bounds.height*0.15)
            
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
            coursesLabel.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: view.bounds.height * 0.04),
            coursesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
        ])
        
        NSLayoutConstraint.activate([
            coursesCollectionView.topAnchor.constraint(equalTo: coursesLabel.bottomAnchor, constant: 5),
            coursesCollectionView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05),
            coursesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            coursesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
 
        ])
        
        
        NSLayoutConstraint.activate([
            numFriendsLabel.topAnchor.constraint(equalTo: coursesCollectionView.bottomAnchor, constant: view.bounds.height * 0.04),
            numFriendsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
        ])
        
        NSLayoutConstraint.activate([
            friendsCollectionView.topAnchor.constraint(equalTo: numFriendsLabel.bottomAnchor, constant: 5),
            friendsCollectionView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.05),
            friendsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            friendsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
 
        ])
        
        NSLayoutConstraint.activate([
            numPostsLabel.topAnchor.constraint(equalTo: friendsCollectionView.bottomAnchor, constant: view.bounds.height * 0.04),
            numPostsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
        ])
        
        NSLayoutConstraint.activate([
            postsCollectionView.topAnchor.constraint(equalTo: numPostsLabel.bottomAnchor, constant: 5),
            postsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: view.bounds.height*0.0002),
            postsCollectionView.leadingAnchor.constraint(equalTo: numPostsLabel.leadingAnchor),
            postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
        ])
    }
    
    func logout() {
        UserDefaults.standard.set(nil, forKey: "userID")
    }
    
    @objc func edit(){
        // push edit profile view controller
        navigationController?.pushViewController(EditProfilePushViewController(id: user_id), animated: true)
    }
    
    @objc func logout_button(){
        // push edit profile view controller
        navigationController?.pushViewController(LogInUsernamePasswordViewController(), animated: true)
        logout()
    }
 
}
 
extension PersonalProfileViewController: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == friendsCollectionView){
            return CGSize(width: 150, height: friendsCollectionView.frame.height)
        }
        else if(collectionView == coursesCollectionView){
            let course = courses[indexPath.row]
            return CGSize(width: course.name.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]).width + 20, height: coursesCollectionView.frame.height)
        }
        else{
            return CGSize(width: view.bounds.width*0.9, height: postsCollectionView.frame.height*0.45)
        }
 
    }
 
    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == friendsCollectionView){
            if let cell = collectionView.cellForItem(at: indexPath) as? FriendsCollectionViewCell {
                let profileVC = ProfilePushViewController(pushProfile: friends[indexPath.row], selfProfile: friends_profiles[indexPath.row], delegate: cell as? SetProfileInfoDelegate, id: self.user_id)
                profileVC.title = ""
                navigationController?.pushViewController(profileVC, animated: true)
            }
        }
        else{
            if let cell = collectionView.cellForItem(at: indexPath) as? PostsCollectionViewCell {
                let postVC = PostPushViewController(post: posts[indexPath.row], delegate: cell as? ChangePostInfoDelegate)
                postVC.title = ""
                navigationController?.pushViewController(postVC, animated: true)
            }
        }
    }
    
    
}
 
extension PersonalProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == friendsCollectionView){
            return friends.count
        }
        else if(collectionView == coursesCollectionView){
            return courses.count
        }
        else{
            return posts.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if(collectionView == friendsCollectionView){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsReuseIdentifier, for: indexPath) as? FriendsCollectionViewCell{
                cell.configure(friend: profile!.friends![indexPath.row])
                cell.backgroundColor = UIColor.white
                cell.contentView.layer.borderColor = UIColor.clear.cgColor
                cell.layer.cornerRadius = 20
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        else if(collectionView == coursesCollectionView){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesReuseIdentifier, for: indexPath) as? CoursesForProflePushCollectionViewCell{
                cell.configure(courseVar: profile!.courses![indexPath.row])
                cell.backgroundColor = UIColor.white
                cell.contentView.layer.borderColor = UIColor.clear.cgColor
                cell.layer.cornerRadius = 20
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        else if(collectionView == postsCollectionView){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostsReuseIdentifier, for: indexPath) as? PostsCollectionViewCell{
                cell.configure(post: profile!.posts![indexPath.row])
                cell.backgroundColor = UIColor.white
                //cell.layer.borderColor = UIColor.black.cgColor
                cell.contentView.layer.borderColor = UIColor.clear.cgColor
                //cell.layer.borderColor = UIColor.white.cgColor
                cell.layer.cornerRadius = 20
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        else{
            return UICollectionViewCell()
        }
        
    }
}
 



