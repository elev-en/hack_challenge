//
//
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class ExploreViewController: UIViewController {
    
    
    // searches all posts
    // filtered table view
    let newPost = UIButton()
    
    let postsReuseIdentifier: String = "PostsReuseIdentifier"
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    
    var allPosts: [Post] = []
    var filteredPosts: [Post] = []
    var filter: [Bool] = []
    
    var postCollectionView: UICollectionView!
    let spacing: CGFloat = 10
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        title = "Home"
        
        let postlayout = UICollectionViewFlowLayout()
        postlayout.minimumLineSpacing = spacing
        postlayout.minimumInteritemSpacing = spacing
        postlayout.scrollDirection = .vertical
        
        postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: postlayout)
        postCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postCollectionView.register(PostsCollectionViewCell.self, forCellWithReuseIdentifier: postsReuseIdentifier)
        

        postCollectionView.dataSource = self
        postCollectionView.delegate = self
        view.addSubview(postCollectionView)
        
        newPost.setTitle("POST +", for: .normal)
        newPost.backgroundColor = UIColor(red: 142.0/255.0, green: 136.0/255.0, blue: 184.0/255.0, alpha: 1)
        newPost.layer.borderColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        newPost.layer.borderWidth = 0
        newPost.layer.cornerRadius = 21
        newPost.translatesAutoresizingMaskIntoConstraints = false
        newPost.addTarget(self, action: #selector(presentNewPostViewController), for: .touchUpInside)
        view.addSubview(newPost)

        
        createData()
        
        setupConstraints()
    }
    
    func setupConstraints(){
    
        
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height*0.80)
        ])
        
        NSLayoutConstraint.activate([
            newPost.topAnchor.constraint(equalTo: postCollectionView.bottomAnchor),
            newPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            newPost.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            newPost.bottomAnchor.constraint(equalTo: postCollectionView.bottomAnchor, constant: view.bounds.height*0.05)
        ])
        
        
    }
    
    
    func createData(){
//        NetworkManager.getAllposts { posts in
//            self.allposts = posts
//            self.postsTableView.reloadData()
//            self.filter = Array(repeating: false, count: self.allposts.count)
//        }
        let course1 = Course(id: 12, code: "CS 1110", name: "CS 1110", users: [])
    
        
        let profile1 = Profile(id: 2, username: "Sam Smith", posts: [], comments: [], courses: [], friends: [], session_token: "idk", session_expiration: "idk", update_token: "idk")
        
        let post1 = Post(id: 1, poster: profile1, header: "review together before prelim?", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "mann library, 2nd floor", comments: [], course: course1)
        let post2 = Post(id: 3, poster: profile1, header: "work on problem set!", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "olin library, basement", comments: [], course: course1)
        let post3 = Post(id: 5,poster: profile1, header: "study for finals", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "hu shih lounge", comments: [], course: course1)
        
        
        
        let posts = [post1, post2, post3]
        
        self.allPosts = posts
        self.postCollectionView.reloadData()
        self.filter = Array(repeating: false, count: self.allPosts.count)

    }
    @objc func presentNewPostViewController() {
        navigationController?.present(NewPostViewController(), animated: true)
    }
    
}


extension ExploreViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
        return CGSize(width: collectionView.frame.width*0.92, height: collectionView.frame.height*0.15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PostsCollectionViewCell {
            let postVC = PostPushViewController(post: allPosts[indexPath.row], delegate: cell as? ChangePostInfoDelegate)
            postVC.title = "post"
            navigationController?.pushViewController(postVC, animated: true)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive{
            return filteredPosts.count
        }
        return allPosts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postsReuseIdentifier, for: indexPath) as? PostsCollectionViewCell{
            cell.configure(post: allPosts[indexPath.row])
            cell.backgroundColor = UIColor.white
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }

}

