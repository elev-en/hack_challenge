//
//  AddClassesViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/24/22.
//

import UIKit

class AddClassesViewController: UIViewController {

    let classesTableView = UITableView()
    let classesReuseIdentifier = "ClassesReuseIdentifier"
    let searchController = UISearchController(searchResultsController: nil)
    
    let addClassesButton = UIButton()
    
    var allClasses: [Course] = []
    var filteredClasses: [Course] = []
    let selectedClasses: [Course] = []
    var filter: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        classesTableView.translatesAutoresizingMaskIntoConstraints = false
        classesTableView.delegate = self
        classesTableView.dataSource = self
        classesTableView.tableHeaderView = searchController.searchBar
        classesTableView.register(ClassesTableViewCell.self, forCellReuseIdentifier: classesReuseIdentifier)
        view.addSubview(classesTableView)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.darkGray
        
        createData()
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            classesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            classesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            classesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            classesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createData(){
        NetworkManager.getAllClasses { classes in
            self.allClasses = classes
            self.classesTableView.reloadData()
            self.filter = Array(repeating: false, count: self.allClasses.count)
        }
    }
    
}

extension AddClassesViewController: UISearchResultsUpdating {
   
    private func filterClasses(for searchText: String) {
       filteredClasses = allClasses.filter { classes in
           return classes.name.lowercased().contains(searchText.lowercased())
       }
           classesTableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController)
    {
        filterClasses(for: searchController.searchBar.text ?? "")
    }
}

extension AddClassesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = classesTableView.cellForRow(at: indexPath) as! ClassesTableViewCell
        for i in 0 ... allClasses.count {
            if cell.courseLabel.text?.lowercased() == allClasses[i].name.lowercased() {
                filter[i] = true
            }
        }
        
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
}

extension AddClassesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredClasses.count
        }
        return allClasses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: classesReuseIdentifier, for: indexPath) as! ClassesTableViewCell
        let classObject = filteredClasses[indexPath.row]
        cell.configure(course: classObject)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
