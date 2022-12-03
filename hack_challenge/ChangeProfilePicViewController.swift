//
//  ChangeProfilePicViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/27/22.
//

import UIKit

class ChangeProfilePicViewController: UIViewController {

    weak var delegate: ChangeImageDelegate?
    weak var image: UIImage?
    var imageName: String
    
    init(inputDelegate: ChangeImageDelegate, profImage: ProfileImage){
        delegate = inputDelegate
        image = profImage.image
        imageName = profImage.imageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let currentProfile = UIImageView()
    let background = UIImageView()
    var profilepicsCollectionView: UICollectionView!
    var profilePics: [ProfileImage] = []
    let profilePicReuseIdentifier = "ProfilePicReuseIdentifier"
    var picSpacing: CGFloat = 10
    let saveButton = UIButton()
    
    let fairy = ProfileImage(imageName: "fairy", image: UIImage(named: "fairy")!)
    let angel = ProfileImage(imageName: "angel", image: UIImage(named: "angel")!)
    let aesthetic = ProfileImage(imageName: "aesthetic", image: UIImage(named: "aesthetic")!)
    let buckethat = ProfileImage(imageName: "bucket hat", image: UIImage(named: "bucket hat")!)
    let butterfly = ProfileImage(imageName: "butterfly", image: UIImage(named: "butterfly")!)
    let sprout = ProfileImage(imageName: "sprout", image: UIImage(named: "sprout")!)
    let devil = ProfileImage(imageName: "devil", image: UIImage(named: "devil")!)
    let amongus = ProfileImage(imageName: "among us", image: UIImage(named: "among us")!)
    let smiley = ProfileImage(imageName: "smiley face", image: UIImage(named: "smiley face")!)
    let frog = ProfileImage(imageName: "frog", image: UIImage(named: "frog")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        profilePics += [fairy, angel, aesthetic, buckethat, butterfly, sprout, devil, amongus, smiley, frog]
        print(profilePics)
        
        let profilePicsLayout = UICollectionViewFlowLayout()
        profilePicsLayout.minimumLineSpacing = picSpacing
        profilePicsLayout.minimumInteritemSpacing = picSpacing
        profilePicsLayout.scrollDirection = .vertical
        
        currentProfile.image = image
        currentProfile.contentMode = .scaleAspectFill
        currentProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentProfile)
        currentProfile.layer.masksToBounds = true
        currentProfile.layer.cornerRadius = currentProfile.bounds.width / 2
        currentProfile.contentMode = .scaleAspectFit
        
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.addTarget(self, action: #selector(changeFieldsAndDismiss), for: .touchUpInside)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        profilepicsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: profilePicsLayout)
        profilepicsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        profilepicsCollectionView.register(ProfilePicCollectionViewCell.self, forCellWithReuseIdentifier: profilePicReuseIdentifier)
        profilepicsCollectionView.dataSource = self
        profilepicsCollectionView.delegate = self
        view.addSubview(profilepicsCollectionView)
        
        setupConstraints()
        
    }
    
    @objc func changeFieldsAndDismiss(){
        
        delegate?.changeImage(outputImage: currentProfile.image!, imageName: imageName)
        dismiss(animated:true, completion: nil)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
            
        ])
        
        NSLayoutConstraint.activate([
            currentProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            currentProfile.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            currentProfile.heightAnchor.constraint(equalToConstant: 175)
        ])
        
        NSLayoutConstraint.activate([
            profilepicsCollectionView.topAnchor.constraint(equalTo: currentProfile.bottomAnchor, constant: 50),
            profilepicsCollectionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profilepicsCollectionView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -50),
            profilepicsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75)
        ])
    }

}

protocol ChangeImageDelegate: UIViewController{
    func changeImage(outputImage: UIImage, imageName: String)
}

extension ChangeProfilePicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return picSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profilePics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = profilepicsCollectionView.dequeueReusableCell(withReuseIdentifier: profilePicReuseIdentifier, for: indexPath) as? ProfilePicCollectionViewCell {
                cell.configure(profilePic: profilePics[indexPath.row])
                return cell
            }
            else {
                return UICollectionViewCell()
            }
        
    }
    
}

extension ChangeProfilePicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = ((collectionView.frame.width - 10)/2.0)
            let height = width
            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath) as! ProfilePicCollectionViewCell
        currentProfile.image = cell.profileImageView.image
        for pic in profilePics {
            if pic.image == currentProfile.image {
                imageName = pic.imageName
            }
        }
    }
}
