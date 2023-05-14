//
//  MainTabBarController.swift
//  Podcast
//
//  Created by Le Tong Minh Hieu on 08/04/2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        
        setupViewControllers()
    }
    
    // MARK: Setup Functions

    func setupViewControllers() {
        viewControllers = [
            generateNavigationController(for: PodcastSearchController(), title: "Search", image: UIImage(named: "search")),
            generateNavigationController(for: ViewController(), title: "Favorites", image: UIImage(named: "favorites")),
            generateNavigationController(for: ViewController(), title: "Downloads", image: UIImage(named: "downloads"))
        ]
    }
    
    // MARK: Helper Functions
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
