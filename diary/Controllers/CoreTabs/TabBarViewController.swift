//
//  TabBarViewController.swift
//  diary
//
//  Created by Акмарал Тажиева on 05.12.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()

        
    }
    private func setUpControllers() {
        guard let currentUserEmail = UserDefaults.standard.string(forKey: "email") else {
            return
        }
        let home = HomeViewController()
        home.title = "Home"
    
        let profile = ProfileViewController(currentEmail: currentUserEmail)
        profile.title = "Profile"
        
        home.navigationItem.largeTitleDisplayMode = .always
        profile.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: profile)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        UITabBar.appearance().tintColor = UIColor(#colorLiteral(red: 0.9260049462, green: 0.2680995464, blue: 0.7393044233, alpha: 1))
        UITabBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.9260049462, green: 0.2680995464, blue: 0.7393044233, alpha: 1))
        
        
        setViewControllers([nav1, nav2], animated: true)


    }
 

}
