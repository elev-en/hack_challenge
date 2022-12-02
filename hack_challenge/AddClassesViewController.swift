//
//  AddClassesViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/24/22.
//

import UIKit

class AddClassesViewController: UIViewController {
    
    let background = UIImageView()

    var user_id: Int
    let classesTableView = UITableView()
    let classesReuseIdentifier = "ClassesReuseIdentifier"
    let searchController = UISearchController(searchResultsController: nil)
    
    let addClassesButton = UIButton()
    let classCartButton = UIBarButtonItem()
    
    var getallClasses: [CourseResponse] = []
    var allClasses:[Course] = []
    var filteredClasses: [Course] = []
    var selectedClasses: [Course] = []
    var classList: [Course] = []
    var filter: [Bool] = []
    
    init(id: Int){
        self.user_id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        classesTableView.rowHeight = 25
        classesTableView.backgroundColor = UIColor.clear
        view.addSubview(classesTableView)
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.darkGray.withAlphaComponent(0.75)
        searchController.searchBar.autocorrectionType = .no
        searchController.searchBar.autocapitalizationType = .none
        
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
            classesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width*0.02),
            classesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.bounds.width*0.02),
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
        if selectedClasses.count != 0 {
            for i in 0 ... selectedClasses.count-1 {
                if !classList.contains(selectedClasses[i]) {
                    classList.append(selectedClasses[i])
                    print(classList)
                }
            }
            selectedClasses.removeAll()
            for i in 0 ... filter.count-1 {
                filter[i] = false
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "No classes were selected to be added into cart.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")

                    case .cancel:
                    print("cancel")

                    case .destructive:
                    print("destructive")

                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func createData(){
        NetworkManager.getAllClasses { classes in
            self.allClasses = classes.courses
            self.classesTableView.reloadData()
            self.filter = Array(repeating: false, count: self.allClasses.count)
        }
    }
    
    @objc func pushClassesCartView(){
        navigationController?.pushViewController(ClassesCartViewController(id: user_id, classList: classList), animated: true)
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
        print("selected")
        let range = ..<(cell.courseLabel.text?.firstIndex(of: ":"))!
        print(cell.courseLabel.text?[range])
        for i in 0 ... allClasses.count-1 {
            if (cell.courseLabel.text?[range])! == allClasses[i].name {
                if(filter[i]){
                    filter[i] = false
                    cell.changeBackground(selected: filter[i])
                    if let index = selectedClasses.firstIndex(of: allClasses[i]) {
                        selectedClasses.remove(at: index)
                    }
                } else {
                    filter[i] = true
                    cell.changeBackground(selected: filter[i])
                    selectedClasses.append(allClasses[i])
                }
            }
        }
        
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
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
        if searchController.isActive && searchController.searchBar.text != "" {
            let classObject = filteredClasses[indexPath.row]
        }
        let classObject = allClasses[indexPath.row]
        cell.configure(course: classObject)
        //cell.changeBackground(selected: false)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

protocol sendClassListDelegate: UIViewController {
    func sendClassList(list: [Course])
}


