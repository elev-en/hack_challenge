//
//  ClassesCartViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class CoursesSearchViewController: UIViewController {
    
    let background = UIImageView()
    let classesTableView = UITableView()
    let classReuseIdentifier = "ClassReuseIdentifier"
    
    var classList: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your Classes"
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)

        classesTableView.translatesAutoresizingMaskIntoConstraints = false
        classesTableView.delegate = self
        classesTableView.dataSource = self
        classesTableView.register(ClassesTableViewCell.self, forCellReuseIdentifier: classReuseIdentifier)
        view.addSubview(classesTableView)
        
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
            classesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func pushMakeProfileViewController(){
        //navigationController?.pushViewController(MakeProfileViewController(id: user_id), animated: true)

    }
}

extension CoursesSearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
                classList.remove(at: indexPath.row)
                classesTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension CoursesSearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: classReuseIdentifier, for: indexPath) as! ClassesTableViewCell
        let classObject = classList[indexPath.row]
        cell.configure(course: classObject)
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension CoursesSearchViewController: sendClassListDelegate {
    func sendClassList(list: [Course]) {
        classList = list
    }
}
    


