//
//  TabBarController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 28.10.2022.
//

import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainPageViewController = MainPageViewController()
        let profileViewController = ProfileViewController()
        
        mainPageViewController.title = "Main"
        profileViewController.title = "Profile"
        
        self.setViewControllers([mainPageViewController, profileViewController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["house", "person"]
        
        for x in 0...1{
            if #available(iOS 13.0, *) {
                items[x].image = UIImage(systemName: images[x])
            } else {
                // Fallback on earlier versions
            }
        }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
}
