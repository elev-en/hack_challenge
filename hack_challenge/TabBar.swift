//
//  TabBar.swift
//  hack_challenge
//
//  Created by Elaine Tsai on 11/29/22.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //self.navigationItem.setHidesBackButton(true, animated: false)
        
        UITabBar.appearance().barTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: SearchViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: ExploreViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: PersonalProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            return navController
    }
}
