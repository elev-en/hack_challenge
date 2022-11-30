
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

       title = "search for profiles"

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
       searchController.searchBar.sizeToFit()
       searchController.searchBar.becomeFirstResponder()
       self.navigationItem.titleView = searchController.searchBar
       self.searchController.searchBar.barTintColor = UIColor.white
       
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
           profileCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
       ])
       
       
   }
   
   
   func createData(){
//        NetworkManager.getAllUsers { profiles in
//            self.allProfiles = profiles
//            self.profilesTableView.reloadData()
//            self.filter = Array(repeating: false, count: self.allProfiles.count)
//        }
       let course1 = Course(name: "cs 2112")
       let course2 = Course(name: "phys 1110")
       let course3 = Course(name: "psych 1101")
       let course4 = Course(name: "econ 1110")
       

       
       let profile1 = Profile(username: "user", password: "pw", name: "martha pollack", courses: [course1, course2, course3, course4], bio: "i love cornhell!", gradYear: 2026, friends: [], posts: [], profileImage: "smiley face")
       
       let post1 = Post(poster: profile1, header: "review together before prelim?", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "mann library, 2nd floor", comments: [], course: course3)
       let post2 = Post(poster: profile1, header: "work on problem set!", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "olin library, basement", comments: [], course: course2)
       let post3 = Post(poster: profile1, header: "study for finals", body: "i hate math", timeStamp: "wed, dec 1st, 5:00 pm", location: "hu shih lounge", comments: [], course: course3)
       
       
       let profile2 = Profile(username: "user", password: "pw", name: "bill nye", courses: [course1, course2, course3, course4], bio: "science rocks!", gradYear: 2023, friends: [profile1], posts: [post1, post2, post3], profileImage: "bucket hat")
       let profile3 = Profile(username: "user", password: "pw", name: "ur mom", courses: [course1, course2, course3, course4], bio: "i hate cornhell!", gradYear: 2025, friends: [profile1, profile2], posts: [], profileImage: "frog")
       let profile4 = Profile(username: "user", password: "pw", name: "ur grandmom", courses: [course1, course2, course3, course4], bio: "i HATE cornhell!", gradYear: 2022, friends: [profile1, profile2, profile3], posts: [post1, post2, post3], profileImage: "sprout")
       let profile5 = Profile(username: "user", password: "pw", name: "you", courses: [course1, course2, course3, course4], bio: "i love milfs!", gradYear: 2023, friends: [profile1, profile2, profile3, profile4], posts: [post1, post2, post3], profileImage: "among us")
       let profile6 = Profile(username: "user", password: "pw", name: "not ur mom", courses: [course1, course2, course3, course4], bio: "i hate milfs!", gradYear: 2024, friends: [profile1, profile2, profile3, profile4, profile5], posts: [post1, post2, post3], profileImage: "angel")
       

       

       
       let profiles = [profile1, profile2, profile3, profile4, profile5, profile6]
       
       self.allProfiles = profiles
       self.profileCollectionView.reloadData()
       self.filter = Array(repeating: false, count: self.allProfiles.count)

   }
   
}

extension ProfileSearchPushViewController: UISearchResultsUpdating {
  
   private func filterProfiles(for searchText: String) {
      filteredProfiles = allProfiles.filter { profiles in
          return profiles.name.lowercased().contains(searchText.lowercased())
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
           profileVC.title = "profile"
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
