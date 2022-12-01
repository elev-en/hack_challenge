//
//  PostPushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class PostPushViewController: UIViewController {
    
    let profImage = UIImageView()
    let profName = UILabel()
    let postBody = UITextView()
    let commentsLabel = UILabel()
    let postHeader = UILabel()
    let timeStamp = UILabel()
    
    var content: [Comment] = []


    let CommentsReuseIdentifier: String = "CommentsReuseIdentifier"
    var comments: UICollectionView!
    let spacing: CGFloat = 10
    
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
        
        profImage.image = UIImage(named: "smiley face")
        profImage.contentMode = .scaleAspectFill
        profImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profImage)
        profImage.layer.masksToBounds = true
        profImage.layer.cornerRadius = profImage.bounds.width / 2
        profImage.contentMode = .scaleAspectFit
        
        profName.text = "\(post.poster.name)"
        profName.font = .systemFont(ofSize: 15, weight: .bold)
        profName.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        view.addSubview(profName)
        profName.isUserInteractionEnabled = false
        profName.translatesAutoresizingMaskIntoConstraints = false
        
        postHeader.text = "\(post.header)"
        postHeader.font = .systemFont(ofSize: 20, weight: .bold)
        postHeader.textColor = UIColor.black
        view.addSubview(postHeader)
        postHeader.isUserInteractionEnabled = false
        postHeader.translatesAutoresizingMaskIntoConstraints = false
        postHeader.numberOfLines = 1;
        //postHeader.minimumFontSize = 8;
        postHeader.adjustsFontSizeToFitWidth = true
        
        postBody.text = "\(post.body)"
        postBody.font = .systemFont(ofSize: 14, weight: .regular)
        postBody.textColor = UIColor(red: 0.424, green: 0.314, blue: 0.439, alpha: 1.00)
        postBody.isUserInteractionEnabled = false
        view.addSubview(postBody)
        postBody.translatesAutoresizingMaskIntoConstraints = false
        
        commentsLabel.text = "Comments (\(post.comments.count)):"
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
        comments.translatesAutoresizingMaskIntoConstraints = false
        comments.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        comments.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: CommentsReuseIdentifier)
        comments.dataSource = self
        comments.delegate = self
        comments.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        view.addSubview(comments)
        
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
   
    func setUpConstraints(){
        
        let verticalPadding: CGFloat = 2
        let sidePadding: CGFloat = 20
        
        let profileImageDim: CGFloat = 80
        

       
        //TODO change to multiplier
        NSLayoutConstraint.activate([
            profImage.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding),
            profImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sidePadding),
            profImage.heightAnchor.constraint(equalToConstant: profileImageDim),
            profImage.widthAnchor.constraint(equalToConstant: profileImageDim),
            
        ])
        
        NSLayoutConstraint.activate([
            profName.topAnchor.constraint(equalTo: profImage.topAnchor),
            profName.heightAnchor.constraint(equalToConstant: 20),
            profName.leadingAnchor.constraint(equalTo: profImage.trailingAnchor, constant: sidePadding)
    
        ])
        
        NSLayoutConstraint.activate([
            postHeader.topAnchor.constraint(equalTo: profName.bottomAnchor, constant: view.bounds.height * 0.0045),
            postHeader.heightAnchor.constraint(equalToConstant: 20),
            postHeader.leadingAnchor.constraint(equalTo: profImage.trailingAnchor, constant: sidePadding)
        ])
        
        NSLayoutConstraint.activate([
            postBody.topAnchor.constraint(equalTo: postHeader.bottomAnchor, constant: view.bounds.height * 0.01),
            postBody.heightAnchor.constraint(equalToConstant: 100),
            postBody.leadingAnchor.constraint(equalTo: profImage.trailingAnchor, constant: sidePadding),
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
    

}
extension PostPushViewController: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width*0.9, height: comments.frame.height*0.4)
        }
 
 
    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
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

