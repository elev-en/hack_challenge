//
//  ProfilePushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//
 
// view that has all the info about a persons profile, looks like personal profile with out the button to calender and no view post button
 
 
import UIKit
 
class ProfilePushViewController: UIViewController {
    
    let user_id: Int
    let headerLabel = UILabel()
    var followButton = UIBarButtonItem()
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
    var friends_username: [String] = []
    var posts: [Post] = []
    var followed: Bool
    var lineView = UIView(frame: CGRect(x: 0, y: 100, width: 320, height: 1.0))
 
    let FriendsReuseIdentifier: String = "FriendsReuseIdentifier"
    var friendsCollectionView: UICollectionView!
    let spacing: CGFloat = 10
    
    let PostsReuseIdentifier: String = "PostsReuseIdentifier"
    var postsCollectionView: UICollectionView!
    
    let CoursesReuseIdentifier: String = "CoursesReuseIdentifier"
    var coursesCollectionView: UICollectionView!
    
    var profile: Profile!
    var friend_profile: Profile!
    var selfProfile: Profile!
    weak var delegate: SetProfileInfoDelegate?
    
    
    
//    var post: Post!
//    weak var postDelegate: ChangePostInfoDelegate?
 
    init(pushProfile: Profile, selfProfile: Profile, delegate: SetProfileInfoDelegate?, id: Int) {
        self.user_id = id
        self.profile = pushProfile
        self.selfProfile = selfProfile
        self.delegate = delegate
        var followText = "follow  "
        followed = false
        
        for friend in self.selfProfile.friends! {
                friends_username.append(friend.username)
            }
        
        if(friends_username.contains(pushProfile.username)){
            followText = "unfollow  "
            followed = true
        }
        self.followButton.title = followText
        super.init(nibName: nil, bundle: nil)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = false
        
        let default_friend = Profile(id: 0, username: "default", picture_id: "default", comments: [])
        var default_friends_profiles: [Profile] = []
        friend_profile = default_friend
        //friend_profiles = default_friends_profiles
        
        NetworkManager.getUser(id: profile.id) { [self]user in
            self.friend_profile = user
        }
        
        for friend in friends {
            NetworkManager.getUser(id: friend.id) { [self]user in
                self.friends_profiles.append(user)
            }
        }
        
        view.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        
 
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
 
 
        headerLabel.numberOfLines = 40
        headerLabel.backgroundColor = .systemGray6
        headerLabel.clipsToBounds = true
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        followButton.target = self
        followButton.action = #selector(follow)
        self.navigationItem.rightBarButtonItem = followButton

        
        // fix profile image to use profile image
        profileImageView.image = UIImage(named: profile.picture_id!)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.contentMode = .scaleAspectFit
 
        let name = "\(profile.name ?? "")"
        let year = "\(profile.grad_year ?? 2026)"

        nameYearTextLabel.text = "\(name), \(year)"
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
        
        //TODO FIX OPTIONALS
        courses = friend_profile.courses ?? []
        //courses = []
        coursesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: courseLayout)
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        coursesCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        coursesCollectionView.register(CoursesForProflePushCollectionViewCell.self, forCellWithReuseIdentifier: CoursesReuseIdentifier)
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        coursesCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(coursesCollectionView)
        
        if(friend_profile.friends != nil){
            friends = friend_profile.friends!
        } else {
            friends=[]
        }
        
        if(friends.count == 1){
            numFriendsLabel.text = "\(friends.count) friend"
        }
        else{
            numFriendsLabel.text = "\(friends.count) friends"
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
        
        friendsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: friendsLayout)
        friendsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        friendsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        friendsCollectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: FriendsReuseIdentifier)
        friendsCollectionView.dataSource = self
        friendsCollectionView.delegate = self
        friendsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(friendsCollectionView)
        
        numPostsLabel.text = "\(profile.posts!.count) posts"
        numPostsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        numPostsLabel.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        view.addSubview(numPostsLabel)
        numPostsLabel.isUserInteractionEnabled = false
        numPostsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let postsLayout = UICollectionViewFlowLayout()
        postsLayout.minimumLineSpacing = spacing
        postsLayout.minimumInteritemSpacing = spacing
        postsLayout.scrollDirection = .vertical
        
        //posts = profile.posts
        posts = []
        postsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: postsLayout)
        postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        postsCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: PostsReuseIdentifier)
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        postsCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(postsCollectionView)
        
 
        let bio = "\(profile.bio ?? "")"
        bioTextField.text = "\(bio)"
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
            profileImageView.heightAnchor.constraint(equalToConstant: view.bounds.height*0.2)
            
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
            postsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.bounds.height*0.0002),
            postsCollectionView.leadingAnchor.constraint(equalTo: numPostsLabel.leadingAnchor),
            postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
        ])
        
        
        
    }
 
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func follow(){
        if(followed){
            let index = selfProfile.friends!.firstIndex(of: profile) ?? -1
            if(index != -1){
                selfProfile.friends!.remove(at: index)
            }
            NetworkManager.unfriend(user_id: user_id, friend_id: profile.id) {_ in}
            followed = false
            followButton.title = "follow  "
        }
        else{
            selfProfile.friends!.append(profile)
            NetworkManager.getUser(id: user_id) { user in
                NetworkManager.friend(user_id: self.user_id, friend_id: self.profile.id, session_token: user.session_token!) {_ in}
            }
            
            followed = true
            followButton.title = "unfollow  "
        }
    }
 
}
 
extension ProfilePushViewController: UICollectionViewDelegateFlowLayout {
 
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
                let postVC = PostPushViewController(post: posts[indexPath.row], delegate: cell as? ChangePostInfoDelegate, user_id: user_id, post_id: posts[indexPath.row].id)
                postVC.title = ""
                navigationController?.pushViewController(postVC, animated: true)
            }
        }
    }
    
    
}
 
extension ProfilePushViewController: UICollectionViewDataSource {
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
                cell.configure(friend: friend_profile.friends![indexPath.row])
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
                cell.configure(courseVar: friend_profile.courses![indexPath.row])
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
                cell.configure(post: profile.posts![indexPath.row])
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
 
 
protocol SetProfileInfoDelegate: AnyObject {
    func changeProfileInfo(profile: Profile)
}
