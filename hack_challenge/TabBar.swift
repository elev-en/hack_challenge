//
//  TabBar.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/29/22.
//

import UIKit

class TabBar: UITabBarController {

    let user_id: Int
    
    init(id: Int){
        self.user_id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        UITabBar.appearance().barTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: SearchViewController(id: user_id), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: ExploreViewController(id: user_id), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: PersonalProfileViewController(id: user_id), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            return navController
    }
}
