//
//  DetailsViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 3.11.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    let tabBar = TabBarController()
    let database = Database()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    
    var imageUrl: String?
    var id: Int?
    var titleOfProduct: String?
    var price: Double?
    var descriptionOfProduct: String?
    var category: String?
    var rating: Rating?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true //Tab barın gösterilmemesini sağlar.
        
        let url = URL(string: imageUrl ?? "")
        imageView.kf.setImage(with: url)
        
        idText.text = "ID: " + String(id ?? 0)
        
        titleText.text = "Title: " + (titleOfProduct ?? "")
        
        priceText.text = "Price: " + String(price ?? 0.0)
        
        descriptionText.text = "Description: " + (descriptionOfProduct ?? "")
        
        categoryText.text = "Category: " + (category ?? "")
        
        ratingText.text = "Rating: \(rating?.rate ?? 0.0) / \(rating?.count ?? 0)"
    }
    
    @IBAction func addToCardButtonTapped(_ sender: UIButton) {
        database.addProductToBasket(productID: id ?? 0)
        navigationController?.pushViewController(BasketViewController(), animated: true)
    }
    
}
