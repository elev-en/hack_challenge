//
//  PostPushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class PostPushViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let profileName = UILabel()
    let titleLabel = UILabel()
    let postBody = CommentTextField()
    let courseTextField = UITextField()
    let timeStamp = UILabel()
    let location = UILabel()
    let commentsLabel = UILabel()
    var addComment = UIBarButtonItem()

    
    var content: [Comment] = []

        
    let CommentsReuseIdentifier: String = "CommentsReuseIdentifier"
    var comments: UICollectionView!
    let spacing: CGFloat = 5
    
    var post: Post!
    weak var delegate: ChangePostInfoDelegate?
 
    init(post: Post, delegate: ChangePostInfoDelegate?) {
        self.post = post
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)

        profileImageView.image = UIImage(named: post.poster.profileImage)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.contentMode = .scaleAspectFit
        
        
        var name = post.poster.name
        let index = name.firstIndex(of: " ")!
        let firstName = String(name[..<index])
        
        profileName.text = firstName
        profileName.textAlignment = .left
        profileName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        profileName.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        profileName.isUserInteractionEnabled = false

        profileName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileName)
 
        titleLabel.text = "\(post.header)"
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = UIColor.black
        titleLabel.isUserInteractionEnabled = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1;
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
 
        courseTextField.text = post.course.name
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
        view.addSubview(courseTextField)
 
        timeStamp.text = "wed, dec 1st, 5:00 pm"
        //timeStamp.text = post.timeStamp
        timeStamp.textAlignment = .left
        timeStamp.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        timeStamp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeStamp)
        
        location.text = post.location
        location.textAlignment = .left
        location.font = UIFont.systemFont(ofSize: 10)
        location.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(location)
        
        postBody.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        postBody.isUserInteractionEnabled = false
        postBody.backgroundColor = UIColor.white
        postBody.text = "\(post.body)"
        postBody.font = .systemFont(ofSize: 12, weight: .regular)
        postBody.textColor = UIColor.black
        postBody.layer.borderWidth = 1
        postBody.layer.cornerRadius = 8
        view.addSubview(postBody)
        postBody.translatesAutoresizingMaskIntoConstraints = false
        
        commentsLabel.text = "comments (\(post.comments.count)):"
        commentsLabel.font = .systemFont(ofSize: 14, weight: .regular)
        commentsLabel.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        view.addSubview(commentsLabel)
        commentsLabel.isUserInteractionEnabled = false
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let commentsLayout = UICollectionViewFlowLayout()
        commentsLayout.minimumLineSpacing = spacing
        commentsLayout.minimumInteritemSpacing = spacing
        commentsLayout.scrollDirection = .vertical
        
        content = post.comments
        comments = UICollectionView(frame: .zero, collectionViewLayout: commentsLayout)
        //comments.backgroundColor = UIColor.white
        comments.backgroundColor = UIColor.clear.withAlphaComponent(0)
        comments.translatesAutoresizingMaskIntoConstraints = false
        comments.register(CommentCollectionViewCell.self, forCellWithReuseIdentifier: CommentsReuseIdentifier)
        comments.dataSource = self
        comments.delegate = self
        view.addSubview(comments)
        
        addComment.image = UIImage(systemName: "plus.message")
        addComment.target = self
        addComment.action = #selector(pushAddComment)
        navigationItem.rightBarButtonItem = addComment
        
        setupConstraints()
    }
    
    
    func setupConstraints(){
        let verticalPadding: CGFloat = 2
        let sidePadding: CGFloat = 20.0
        let profileImageDim: CGFloat = 80

 
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding),
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sidePadding),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageDim),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageDim),
        ])
        
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            profileName.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: view.bounds.width*0.04),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
        ])
        
        NSLayoutConstraint.activate([
            courseTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.bounds.height*0.007),
            courseTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: view.bounds.width*0.04)
 
        ])
        
        NSLayoutConstraint.activate([
            timeStamp.topAnchor.constraint(equalTo: courseTextField.bottomAnchor, constant: view.bounds.height*0.007),
            timeStamp.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: view.bounds.width*0.04),
            timeStamp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
        ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: timeStamp.bottomAnchor, constant: view.bounds.height*0.003),
            location.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: view.bounds.width*0.04),
            location.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
 
        ])
        
        NSLayoutConstraint.activate([
            postBody.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: view.bounds.height * 0.02),
            postBody.heightAnchor.constraint(equalToConstant: 100),
            postBody.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            postBody.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sidePadding)
        ])
        
        NSLayoutConstraint.activate([
            commentsLabel.topAnchor.constraint(equalTo: postBody.bottomAnchor, constant: view.bounds.height * 0.06),
            commentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
        ])
        
        NSLayoutConstraint.activate([
            comments.topAnchor.constraint(equalTo: commentsLabel.bottomAnchor, constant: 5),
            comments.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.bounds.height*0.0002),
            comments.leadingAnchor.constraint(equalTo: commentsLabel.leadingAnchor),
            comments.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)
            
        ])
        
        
        
        
        
    
    }
    
    @objc func pushAddComment(){
        let commentVC = AddCommentPushViewController()
        commentVC.title = ""
        navigationController?.pushViewController(commentVC, animated: true)
        
    }
    

}
extension PostPushViewController: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width*0.9, height: view.bounds.height*0.13)
        }
 
 
    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
}

extension PostPushViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return content.count

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentsReuseIdentifier, for: indexPath) as? CommentCollectionViewCell{
            cell.configure(comment: post.comments[indexPath.row])
            cell.backgroundColor = UIColor.white
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.layer.cornerRadius = 20
            return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        
}

protocol ChangePostInfoDelegate: AnyObject {
    func changePostInfo(post: Post)
}

