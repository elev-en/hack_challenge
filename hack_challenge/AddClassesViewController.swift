//
//  AddClassesViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/24/22.
//

import UIKit

class AddClassesViewController: UIViewController {
    
    let background = UIImageView()

    let classesTableView = UITableView()
    let classesReuseIdentifier = "ClassesReuseIdentifier"
    let searchController = UISearchController(searchResultsController: nil)
    
    let addClassesButton = UIButton()
    let classCartButton = UIBarButtonItem()
    
    var allClasses: [Course] = []
    var filteredClasses: [Course] = []
    var selectedClasses: [Course] = []
    var classList: [Course] = []
    var filter: [Bool] = []
    
    weak var delegate: sendClassListDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)

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
        
        classCartButton.image = UIImage(systemName: "cart")
        classCartButton.target = self
        classCartButton.action = #selector(pushClassesCartView)
        navigationItem.rightBarButtonItem = classCartButton
        
        addClassesButton.setTitle("Add Classes", for: .normal)
        addClassesButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        addClassesButton.layer.borderWidth = 2
        addClassesButton.layer.cornerRadius = 5
        addClassesButton.translatesAutoresizingMaskIntoConstraints = false
        addClassesButton.addTarget(self, action: #selector(addClasses), for: .touchUpInside)
        view.addSubview(addClassesButton)
        
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
            classesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            classesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            classesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            classesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addClassesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addClassesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addClassesButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            addClassesButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    @objc func addClasses(){
//        if selectedClasses.count != 0 {
//            for i in 0 ... selectedClasses.count {
//                if !classList.contains(selectedClasses[i]) {
//                    classList.append(selectedClasses[i])
//                }
//            }
//            selectedClasses.removeAll()
//            for i in 0 ... filter.count {
//                filter[i] = false
//            }
//        } else {
//            let alert = UIAlertController(title: "Error", message: "No classes were selected to be added into cart.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//                switch action.style{
//                    case .default:
//                    print("default")
//
//                    case .cancel:
//                    print("cancel")
//
//                    case .destructive:
//                    print("destructive")
//
//                }
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    
    func createData(){
        NetworkManager.getAllClasses { classes in
            self.allClasses = classes
            self.classesTableView.reloadData()
            self.filter = Array(repeating: false, count: self.allClasses.count)
        }
    }
    
    @objc func pushClassesCartView(){
        self.delegate?.sendClassList(list: classList)
        navigationController?.pushViewController(ClassesCartViewController(), animated: true)
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
//        let cell = classesTableView.cellForRow(at: indexPath) as! ClassesTableViewCell
//        for i in 0 ... allClasses.count {
//            if cell.courseLabel.text?.lowercased() == allClasses[i].name.lowercased() {
//                if(filter[i]){
//                    filter[i] = false
//                    cell.changeBackground(selected: filter[i])
//                    if let index = selectedClasses.firstIndex(of: allClasses[i]) {
//                        selectedClasses.remove(at: index)
//                    }
//                } else {
//                    filter[i] = true
//                    cell.changeBackground(selected: filter[i])
//                    selectedClasses.append(allClasses[i])
//                }
//            }
//        }
        
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

protocol sendClassListDelegate: UIViewController {
    func sendClassList(list: [Course])
}


