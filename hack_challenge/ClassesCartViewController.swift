//
//  ClassesCartViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/26/22.
//

import UIKit

class ClassesCartViewController: UIViewController {

    let doneButton = UIButton()
    let classesTableView = UITableView()
    let classReuseIdentifier = "ClassReuseIdentifier"
    
    var classList: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your Classes"

        classesTableView.translatesAutoresizingMaskIntoConstraints = false
        classesTableView.delegate = self
        classesTableView.dataSource = self
        classesTableView.register(ClassesTableViewCell.self, forCellReuseIdentifier: classReuseIdentifier)
        view.addSubview(classesTableView)
        
        doneButton.setTitle("Done Adding Classes", for: .normal)
        doneButton.layer.backgroundColor = UIColor(red: 0.60, green: 0.62, blue: 0.80, alpha: 1.00).cgColor
        doneButton.layer.borderWidth = 2
        doneButton.layer.cornerRadius = 5
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.addTarget(self, action: #selector(pushMakeProfileViewController), for: .touchUpInside)
        view.addSubview(doneButton)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            doneButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            doneButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            classesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            classesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            classesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            classesTableView.bottomAnchor.constraint(equalTo: doneButton.topAnchor)
        ])
    }
    
    @objc func pushMakeProfileViewController(){
        navigationController?.pushViewController(MakeProfileViewController(), animated: true)

    }
}

extension ClassesCartViewController: UITableViewDelegate {

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

extension ClassesCartViewController: UITableViewDataSource {

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

extension ClassesCartViewController: sendClassListDelegate {
    func sendClassList(list: [Course]) {
        classList = list
    }
}
    

