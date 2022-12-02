//
//  NewPostViewController.swift
//  hack_challenge
//
//  Created by Samantha Smith on 11/30/22.
//

import UIKit

class NewPostViewController: UIViewController {
    
    let background = UIImageView()
    let user_id: Int
    let postTitleTextField = UITextField()
    let postTextField = UITextField()
    let locationTitleTextField = UITextField()
    let locationTextField = UITextField()
    let box = UILabel()
    let dateTitleTextField = UITextField()
    let dateTextField = UITextField()
    let courseTitleTextField = UITextField()
    let postBodyTextField = UITextField()
    let postBodyTextView = UITextView()
    let post = UIButton()
    
    var courses: [Course] = []
    var courseSelected: Course?
    let CourseReuseIdentifier: String = "CourseReuseIdentifier"
    var coursesCollectionView: UICollectionView!
    let spacing: CGFloat = 10
    
    init(id: Int){
        self.user_id = id
        // TODO; NETWORK manager stuff for courses
        /*courses = NetworkManager.getUserCourses(id: user_id){response in
            print(response)
        }*/
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        post.setTitle("POST", for: .normal)
        post.addTarget(self, action: #selector(sharePost), for: .touchUpInside)
        post.setTitleColor(.systemBlue, for: .normal)
        post.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        post.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(post)

//        saveButton.setTitle("SAVE", for: .normal)
//        saveButton.addTarget(self, action: #selector(changeFieldsAndDismiss), for: .touchUpInside)
//        saveButton.setTitleColor(.systemBlue, for: .normal)
//        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(saveButton)
        
        
        postTitleTextField.text = "POST TITLE"
        postTitleTextField.isUserInteractionEnabled = false
        postTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        postTitleTextField.textColor = UIColor.black
        view.addSubview(postTitleTextField)
        postTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let name = NSAttributedString(string: "enter post title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        postTextField.attributedPlaceholder = name
        postTextField.font = .systemFont(ofSize: 15, weight: .light)
        postTextField.textColor = UIColor.black
        postTextField.backgroundColor = UIColor.systemGray5
        postTextField.layer.borderWidth = 1
        postTextField.layer.borderColor = UIColor.systemGray5.cgColor
        postTextField.layer.cornerRadius = 20
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        postTextField.leftView = paddingView
        postTextField.leftViewMode = .always
        view.addSubview(postTextField)
        postTextField.translatesAutoresizingMaskIntoConstraints = false
        postTextField.autocorrectionType = .no
        postTextField.autocapitalizationType = .none
        
        locationTitleTextField.text = "LOCATION"
        locationTitleTextField.isUserInteractionEnabled = false
        locationTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        locationTitleTextField.textColor = UIColor.black
        view.addSubview(locationTitleTextField)
        locationTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        let website = NSAttributedString(string: "ex: mann library, 2nd floor", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        locationTextField.attributedPlaceholder = website
        locationTextField.font = .systemFont(ofSize: 15, weight: .light)
        locationTextField.textColor = UIColor.black
        locationTextField.backgroundColor = UIColor.systemGray5
        locationTextField.layer.borderWidth = 1
        locationTextField.layer.borderColor = UIColor.systemGray5.cgColor
        locationTextField.layer.cornerRadius = 20
        let paddingView2: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        locationTextField.leftView = paddingView2
        locationTextField.leftViewMode = .always
        view.addSubview(locationTextField)
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.autocorrectionType = .no
        locationTextField.autocapitalizationType = .none
        
        box.numberOfLines = 20
        box.backgroundColor = UIColor.systemGray5
        box.clipsToBounds = true
        box.layer.cornerRadius = 15
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        
        box.numberOfLines = 20
        box.backgroundColor = UIColor.systemGray5
        box.clipsToBounds = true
        box.layer.cornerRadius = 15
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        dateTitleTextField.text = "DATE"
        dateTitleTextField.isUserInteractionEnabled = false
        dateTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        dateTitleTextField.textColor = UIColor.black
        view.addSubview(dateTitleTextField)
        dateTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        let date = NSAttributedString(string: "ex: wed, dec 5, 1:00 pm", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        dateTextField.attributedPlaceholder = date
        dateTextField.font = .systemFont(ofSize: 15, weight: .light)
        dateTextField.textColor = UIColor.black
        dateTextField.backgroundColor = UIColor.systemGray5
        dateTextField.layer.borderWidth = 1
        dateTextField.layer.borderColor = UIColor.systemGray5.cgColor
        dateTextField.layer.cornerRadius = 20
        let paddingView3: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        dateTextField.leftView = paddingView3
        dateTextField.leftViewMode = .always
        view.addSubview(dateTextField)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.autocorrectionType = .no
        dateTextField.autocapitalizationType = .none
        
        courseTitleTextField.text = "SELECT COURSE"
        courseTitleTextField.isUserInteractionEnabled = false
        courseTitleTextField.font = .systemFont(ofSize: 15, weight: .bold)
        courseTitleTextField.textColor = UIColor.black
        view.addSubview(courseTitleTextField)
        courseTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        let courseLayout = UICollectionViewFlowLayout()
        courseLayout.minimumLineSpacing = spacing
        courseLayout.minimumInteritemSpacing = spacing
        courseLayout.scrollDirection = .horizontal
        
        coursesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: courseLayout)
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        coursesCollectionView.backgroundColor = UIColor.white
        coursesCollectionView.register(CoursesCollectionViewCell.self, forCellWithReuseIdentifier: CourseReuseIdentifier)
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        view.addSubview(coursesCollectionView)

        
        
        postBodyTextField.text = "POST BODY"
        postBodyTextField.isUserInteractionEnabled = false
        postBodyTextField.font = .systemFont(ofSize: 15, weight: .bold)
        postBodyTextField.textColor = UIColor.black
        view.addSubview(postBodyTextField)
        postBodyTextField.translatesAutoresizingMaskIntoConstraints = false
        
        postBodyTextView.text = "enter more details"
        postBodyTextView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        postBodyTextView.font = .systemFont(ofSize: 15, weight: .light)
        postBodyTextView.textColor = UIColor.black
        postBodyTextView.backgroundColor = UIColor.systemGray5
        postBodyTextView.layer.borderWidth = 1
        postBodyTextView.layer.borderColor = UIColor.systemGray5.cgColor
        postBodyTextView.layer.cornerRadius = 20
        postBodyTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postBodyTextView)
        
        setUpConstraints()
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            post.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            post.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            post.heightAnchor.constraint(equalToConstant: 20),
            post.widthAnchor.constraint(equalToConstant: 50)
        ])


        NSLayoutConstraint.activate([
            postTitleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                , constant: 30),
            postTitleTextField.heightAnchor.constraint(equalToConstant: 30),
            postTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            postTextField.topAnchor.constraint(equalTo: postTitleTextField
                .bottomAnchor, constant: 10),
            postTextField.heightAnchor.constraint(equalToConstant: 50),
            postTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            postTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )

        NSLayoutConstraint.activate([
            locationTitleTextField.topAnchor.constraint(equalTo: postTextField
                .bottomAnchor, constant: 20),
            locationTitleTextField.heightAnchor.constraint(equalToConstant: 20),
            locationTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: locationTitleTextField
                .bottomAnchor, constant: 10),
            locationTextField.heightAnchor.constraint(equalToConstant: 50),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )
        
        
        NSLayoutConstraint.activate([
            dateTitleTextField.topAnchor.constraint(equalTo: locationTextField
                .bottomAnchor, constant: 20),
            dateTitleTextField.heightAnchor.constraint(equalToConstant: 20),
            dateTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: dateTitleTextField
                .bottomAnchor, constant: 10),
            dateTextField.heightAnchor.constraint(equalToConstant: 50),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )
        
        NSLayoutConstraint.activate([
            courseTitleTextField.topAnchor.constraint(equalTo: dateTextField
                .bottomAnchor, constant: 20),
            courseTitleTextField.heightAnchor.constraint(equalToConstant: 20),
            courseTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            coursesCollectionView.topAnchor.constraint(equalTo: courseTitleTextField
                .bottomAnchor, constant: 10),
            coursesCollectionView.heightAnchor.constraint(equalToConstant: 50),
            coursesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            coursesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            ]
        )
        
        NSLayoutConstraint.activate([
            box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            box.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            box.topAnchor.constraint(equalTo: dateTextField
                .bottomAnchor, constant: 10),
            box.bottomAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 10)
        ])

 
        
        NSLayoutConstraint.activate([
            postBodyTextField.topAnchor.constraint(equalTo: coursesCollectionView.bottomAnchor, constant: 50),
            postBodyTextField.heightAnchor.constraint(equalToConstant: 30),
            postBodyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            postBodyTextView.topAnchor.constraint(equalTo: postBodyTextField
                .bottomAnchor, constant: 10),
            postBodyTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            postBodyTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            postBodyTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
                
        
    }
    
    @objc func sharePost(){
        //networking to create new post
        NetworkManager.createPostForUser(id: user_id, header: postTextField.text!, body: postBodyTextView.text!, location: locationTextField.text!, meetup_time: dateTextField.text!) {_ in}
        self.dismiss(animated: true)
    }
    

}

extension NewPostViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return courses.count
   }
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }

   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
       if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseReuseIdentifier, for: indexPath) as? CoursesCollectionViewCell{
           cell.configure(courseVar: courses[indexPath.row])
           cell.backgroundColor = UIColor.white
           cell.contentView.layer.borderColor = UIColor.clear.cgColor
           cell.layer.cornerRadius = 15
           return cell
       }
       else{
           return UICollectionViewCell()
       }
   }

}
extension NewPostViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let course = courses[indexPath.row]
        return CGSize(width: course.name.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]).width + 2, height: collectionView.frame.height*0.6)
 
    }
    
 
    
 
    func collectionView(_ collectionView: UICollectionView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CoursesCollectionViewCell {
            courseSelected = courses[indexPath.row]
            cell.backgroundColor = .gray
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CoursesCollectionViewCell {
            courseSelected = courses[indexPath.row]
            cell.backgroundColor = UIColor(red: 0.843, green: 0.855, blue: 0.988, alpha: 1.00)
        }
    }
}
