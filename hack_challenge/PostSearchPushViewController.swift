//
//  postSearchPushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class PostSearchPushViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    
    // searches all posts
    // filtered table view

    
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
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        title = "search for posts"
        
        let postlayout = UICollectionViewFlowLayout()
        postlayout.minimumLineSpacing = spacing
        postlayout.minimumInteritemSpacing = spacing
        postlayout.scrollDirection = .vertical
        
        postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: postlayout)
        postCollectionView.backgroundColor = UIColor(red: 0.937, green: 0.941, blue: 0.996, alpha: 1.00)
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postCollectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: postsReuseIdentifier)
        

        postCollectionView.dataSource = self
        postCollectionView.delegate = self
        view.addSubview(postCollectionView)
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        self.navigationItem.titleView = searchController.searchBar
        self.searchController.searchBar.barTintColor = UIColor.white

        
        createData()
        
        setupConstraints()
    }
    
    func setupConstraints(){
    
        
        NSLayoutConstraint.activate([
            postCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            postCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
    
    
    func createData(){
//        NetworkManager.getAllposts { posts in
//            self.allposts = posts
//            self.postsTableView.reloadData()
//            self.filter = Array(repeating: false, count: self.allposts.count)
//        }
        let course1 = Course(name: "cs 2112")
        let course2 = Course(name: "phys 1110")
        let course3 = Course(name: "psych 1101")
        let course4 = Course(name: "econ 1110")
        
        let profile1 = Profile(username: "user", password: "pw", name: "martha pollack", courses: [course1, course2, course3, course4], bio: "i love cornhell!", gradYear: 2026, friends: [], posts: [])
        let profile2 = Profile(username: "user", password: "pw", name: "bill nye", courses: [course1, course2, course3, course4], bio: "science rocks!", gradYear: 2023, friends: [profile1], posts: [])
        let profile3 = Profile(username: "user", password: "pw", name: "ur mom", courses: [course1, course2, course3, course4], bio: "i hate cornhell!", gradYear: 2025, friends: [profile1, profile2], posts: [])
        let profile4 = Profile(username: "user", password: "pw", name: "ur grandmom", courses: [course1, course2, course3, course4], bio: "i HATE cornhell!", gradYear: 2022, friends: [profile1, profile2, profile3], posts: [])
        let profile5 = Profile(username: "user", password: "pw", name: "you", courses: [course1, course2, course3, course4], bio: "i love milfs!", gradYear: 2023, friends: [profile1, profile2, profile3, profile4], posts: [])
        let profile6 = Profile(username: "user", password: "pw", name: "not ur mom", courses: [course1, course2, course3, course4], bio: "i hate milfs!", gradYear: 2024, friends: [profile1, profile2, profile3, profile4, profile5], posts: [])
        
        let post1 = Post(poster: profile1, header: "Study sesh at Olin", body: "who wants to go to olin to study for the CS prelim tonight?",timeStamp: "12/09/21, 7:30 PM", location: "Olin Library",comments: [])
        let post2 = Post(poster: profile2, header: "Hellooooo", body: "I dont have any studying to do i just wanted to post of the app for fun", timeStamp: "12/06/21, 2:03 PM", location: "nope", comments: [])
        let post3 = Post(poster: profile3, header: "Time to Grind", body: "3:30 at mann. be there or be square", timeStamp: "9/03/22, 11:00 PM", location: "Mann Library", comments: [])
        
        let posts = [post1, post2, post3]
        
        self.allPosts = posts
        self.postCollectionView.reloadData()
        self.filter = Array(repeating: false, count: self.allPosts.count)

    }
    
}

extension PostSearchPushViewController: UISearchResultsUpdating {
   
    private func filterposts(for searchText: String) {
       filteredPosts = allPosts.filter { posts in
           return posts.header.lowercased().contains(searchText.lowercased())
       }
           postCollectionView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController)
    {
        filterposts(for: searchController.searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        self.dismiss(animated: true, completion: nil)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true
            postCollectionView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        postCollectionView.reloadData()
    }
}

extension PostSearchPushViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
        return CGSize(width: collectionView.frame.width*0.92, height: collectionView.frame.height*0.15)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? PostCollectionViewCell {
//            let postVC = PostPushViewController(post: allPosts[indexPath.row], delegate: cell as? ChangePostInfoDelegate)
//            postVC.title = "post"
//            navigationController?.pushViewController(postVC, animated: true)
//        }
//    }
    

    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
}

extension PostSearchPushViewController: UICollectionViewDataSource {
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postsReuseIdentifier, for: indexPath) as? PostCollectionViewCell{
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

