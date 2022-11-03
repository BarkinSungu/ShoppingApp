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
        
        let productsViewModel = ProductsViewModel()
        
        let productsViewController = ProductsViewController(viewModel: productsViewModel)
        let searchViewController = SearchViewController()
        let profileViewController = ProfileViewController()
        
        let productsNavigationController = UINavigationController(rootViewController: productsViewController)
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        
        productsNavigationController.title = "Products"
        searchNavigationController.title = "Search"
        profileNavigationController.title = "Profile"
        
        productsViewController.title = "Products"
        searchViewController.title = "Search"
        profileViewController.title = "Profile"
        
        self.setViewControllers([productsNavigationController,
                                 searchNavigationController,
                                 profileNavigationController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["house", "magnifyingglass", "person"]
        
        for x in 0...2{
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
