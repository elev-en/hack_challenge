
//  ProfileSearchPushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class ProfileSearchPushViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate {
   
   
   // searches all profiles
   // filtered table view

   //let profilesTableView = UITableView()
   let background = UIImageView()
   let profilesReuseIdentifier: String = "ProfilesReuseIdentifier"
   let searchController = UISearchController(searchResultsController: nil)
   var searchActive : Bool = false

   var allProfiles: [Profile] = []
   var filteredProfiles: [Profile] = []
   var filter: [Bool] = []
   
   var profileCollectionView: UICollectionView!
   let spacing: CGFloat = 10
       
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       self.navigationItem.setHidesBackButton(true, animated: false)

       title = ""

       background.contentMode = .scaleAspectFill
       background.image = UIImage(named: "background")
       background.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(background)
       
       let profilelayout = UICollectionViewFlowLayout()
       profilelayout.minimumLineSpacing = spacing
       profilelayout.minimumInteritemSpacing = spacing
       profilelayout.scrollDirection = .vertical
       
       profileCollectionView = UICollectionView(frame: .zero, collectionViewLayout: profilelayout)
       profileCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
       profileCollectionView.translatesAutoresizingMaskIntoConstraints = false
       profileCollectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: profilesReuseIdentifier)
       profileCollectionView.dataSource = self
       profileCollectionView.delegate = self
       view.addSubview(profileCollectionView)
       
       self.searchController.searchResultsUpdater = self
       self.searchController.delegate = self
       self.searchController.searchBar.delegate = self
       self.searchController.hidesNavigationBarDuringPresentation = false
       self.searchController.dimsBackgroundDuringPresentation = true
       self.searchController.obscuresBackgroundDuringPresentation = false
       self.searchController.searchBar.sizeToFit()
       self.searchController.searchBar.becomeFirstResponder()
       self.searchController.searchBar.autocorrectionType = .no
       self.searchController.searchBar.autocapitalizationType = .none
       self.navigationItem.titleView = searchController.searchBar
       self.searchController.searchBar.barTintColor = UIColor.white
       self.searchController.searchBar.autocorrectionType = .no
       self.searchController.searchBar.autocapitalizationType = .none
       
       createData()
       
       setupConstraints()
   }
   
   func setupConstraints(){
       NSLayoutConstraint.activate([
           background.topAnchor.constraint(equalTo: view.topAnchor),
           background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           background.widthAnchor.constraint(equalTo: view.widthAnchor)
       ])
   
       
       NSLayoutConstraint.activate([
        profileCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height*0.02),
           profileCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           profileCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        profileCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
       ])
       
       
   }
   
   
   func createData(){
        NetworkManager.getAllUsers { profiles in
            self.allProfiles = profiles
            self.profileCollectionView.reloadData()
            self.filter = Array(repeating: false, count: self.allProfiles.count)
        }
       
       /*let course1 = Course(id: 1, code: "cs 2112", name: "cs 2112", users: [])
       let course2 = Course(id: 1, code: "phys 1110", name: "phys 1110", users: [])
       let course3 = Course(id: 1, code: "psych 1101", name: "psych 1101", users: [])
       let course4 = Course(id: 1, code: "econ 1110", name: "econ 1110", users: [])
       

       
       let profile1 = Profile(id: 1, username: "user", name: "martha pollack", bio: "i love cornhell!",gradYear: 2026, posts: [],comments: [], courses: [course1, course2, course3, course4], friends: [], session_token: "", session_expiration: "", update_token: "")
       
       let comment1 = Comment(id: 1, commenter: profile1, body: "yes email me @__!")
       let comment2 = Comment(id: 1, commenter: profile1, body: "yes email me @__!")

       let post1 = Post(id: 1, poster: profile1, header: "review together before prelim?", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "mann library, 2nd floor", comments: [comment1, comment2], course: course3)
       let post2 = Post(id: 1, poster: profile1, header: "work on problem set!", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "olin library, basement", comments: [], course: course2)
       let post3 = Post(id: 1, poster: profile1, header: "study for finals", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "hu shih lounge", comments: [], course: course3)*/
       
       //let profile2 = Profile(id: 1, username: "user", name: "bill nye", bio: "science rocks!",gradYear: 2023, posts: [post1, post2, post3] ,comments: [], courses: [course1, course2, course3, course4], friends: [profile1], session_token: "", session_expiration: "", update_token: "")
/*
       let profile3 = Profile(id: 1, username: "user", password: "pw", name: "ur mom", bio: "i hate cornhell!",gradYear: 2025, posts: [post1, post2, post3] ,comments: [], courses: [course1, course2, course3, course4], friends: [profile1, profile2], session_token: "", session_expiration: "", update_token: "", profileImage: "frog")

       let profile4 = Profile(id: 1, username: "user", password: "pw", name: "ur grandmom", bio: "i HATE cornhell!", gradYear: 2025, posts: [post1, post2, post3] ,comments: [], courses: [course1, course2, course3, course4], friends: [profile1, profile2, profile3], session_token: "", session_expiration: "", update_token: "", profileImage: "sprout")
       
       let profile5 = Profile(id: 1, username: "user", password: "pw", name: "you", bio: "i love milfs!", gradYear: 2023, posts: [post1, post2, post3] ,comments: [], courses: [course1, course2, course3, course4], friends: [profile1, profile2, profile3, profile4], session_token: "", session_expiration: "", update_token: "", profileImage: "among us")
       
       let profile6 = Profile(id: 1, username: "user", password: "pw", name: "not ur mom", bio: "i hate milfs!", gradYear: 2023, posts: [post1, post2, post3] ,comments: [], courses: [course1, course2, course3, course4], friends: [profile1, profile2, profile3, profile4], session_token: "", session_expiration: "", update_token: "", profileImage: "among us")*/
       

       

       
       //let profiles = [profile1, profile2]
       let profiles = [Profile]()
       self.allProfiles = profiles
       self.profileCollectionView.reloadData()
       self.filter = Array(repeating: false, count: self.allProfiles.count)

   }
   
}

extension ProfileSearchPushViewController: UISearchResultsUpdating {
  
   private func filterProfiles(for searchText: String) {
      filteredProfiles = allProfiles.filter { profiles in
          return profiles.name!.lowercased().contains(searchText.lowercased())
      }
          profileCollectionView.reloadData()
   }
   
   func updateSearchResults(for searchController: UISearchController)
   {
       filterProfiles(for: searchController.searchBar.text ?? "")
   }
   
   func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       searchActive = false
       self.dismiss(animated: true, completion: nil)
   }
   
   func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           searchActive = true
           profileCollectionView.reloadData()
   }

   func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       searchActive = false
       profileCollectionView.reloadData()
   }
}

extension ProfileSearchPushViewController: UICollectionViewDelegateFlowLayout {
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
       return CGSize(width: collectionView.frame.width*0.92, height: view.frame.height*0.15)
   }
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if let cell = collectionView.cellForItem(at: indexPath) as? ProfileCollectionViewCell {
           let profileVC = ProfilePushViewController(pushProfile: allProfiles[indexPath.row], selfProfile: allProfiles[indexPath.row], delegate: cell as? SetProfileInfoDelegate)
           profileVC.title = ""
           navigationController?.pushViewController(profileVC, animated: true)
       }
   }
   

   func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView = UIView()
       headerView.backgroundColor = view.backgroundColor
       return headerView
   }
}

extension ProfileSearchPushViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if searchActive{
           return filteredProfiles.count
       }
       return allProfiles.count
   }
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }

   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profilesReuseIdentifier, for: indexPath) as? ProfileCollectionViewCell{
           cell.configure(profile: allProfiles[indexPath.row])
           cell.backgroundColor = UIColor.white
           //cell.layer.borderColor = UIColor.black.cgColor
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
