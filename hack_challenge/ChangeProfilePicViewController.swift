//
//  ChangeProfilePicViewController.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/27/22.
//

import UIKit

class ChangeProfilePicViewController: UIViewController {

    
    let background = UIImageView()
    var profilepicsCollectionView: UICollectionView!
    var profilePics: [UIImage] = []
    var picSelected = UIImage()
    
    let fairy = UIImage(named: "fairy")
    let angel = UIImage(named: "angel")
    let aesthetic = UIImage(named: "aethetic")
    let buckethat = UIImage(named: "buckethat")
    let butterfly = UIImage(named: "butterfly")
    let sprout = UIImage(named: "sprout")
    let devil = UIImage(named: "devil")
    let amongus = UIImage(named: "among us")
    let smiley = UIImage(named: "smiley face")
    let frog = UIImage(named: "frog")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        //profilePics = [fairy, angel, aesthetic, buckethat, butterfly, sprout, devil, amongus, smiley, frog]
        
        
    }
    
    func setupConstraints(){
        
    }

}
