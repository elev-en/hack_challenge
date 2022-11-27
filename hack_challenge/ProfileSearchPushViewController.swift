//
//  ProfileSearchPushViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/20/22.
//

import UIKit

class ProfileSearchPushViewController: UIViewController {
    
    
    // searches all profiles
    // filtered table view

    let profilesTableView = UITableView()
    let profilesReuseIdentifier = "ProfilesReuseIdentifier"
    let searchController = UISearchController(searchResultsController: nil)
        
    var allProfiles: [Profile] = []
    var filteredProfiles: [Profile] = []
    var filter: [Bool] = []
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "search for profiles"
        // view.backgroundColor = .purple

        profilesTableView.translatesAutoresizingMaskIntoConstraints = false
        profilesTableView.delegate = self
        profilesTableView.dataSource = self
        profilesTableView.tableHeaderView = searchController.searchBar
        profilesTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: profilesReuseIdentifier)
        view.addSubview(profilesTableView)
        
    
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.darkGray
        
        createData()
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            profilesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profilesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profilesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profilesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createData(){
        NetworkManager.getAllProfiles { profiles in
            self.allProfiles = profiles
            self.profilesTableView.reloadData()
            self.filter = Array(repeating: false, count: self.allProfiles.count)
        }
    }
    
}

extension ProfileSearchPushViewController: UISearchResultsUpdating {
   
    private func filterProfiles(for searchText: String) {
       filteredProfiles = allProfiles.filter { profiles in
           return profiles.name.lowercased().contains(searchText.lowercased())
       }
           profilesTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController)
    {
        filterProfiles(for: searchController.searchBar.text ?? "")
    }
}

extension ProfileSearchPushViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = profilesTableView.cellForRow(at: indexPath) as! ProfileTableViewCell
        let profileVC = ProfilePushViewController(profile: allProfiles[indexPath.row], delegate: cell as! ChangeProfileInfoDelegate)
        profileVC.title = "profile"
        navigationController?.pushViewController(profileVC, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
}

extension ProfileSearchPushViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredProfiles.count
        }
        return allProfiles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profilesReuseIdentifier, for: indexPath) as! ProfileTableViewCell
        let profileObject = filteredProfiles[indexPath.row]
        cell.configure(profile: profileObject)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
