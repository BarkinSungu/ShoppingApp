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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    
    var imageUrl: String?
//    {
//        didSet{
//            let url = URL(string: imageUrl ?? "")
//            imageView.kf.setImage(with: url)
//        }
//    }
    var id: Int?
//    {
//        didSet{
//            idText.text = String(id ?? 0)
//        }
//    }
    var titleOfProduct: String?
//    {
//        didSet{
//            titleText.text = titleOfProduct
//        }
//    }
    var price: Double?
//    {
//        didSet{
//            priceText.text = String(price ?? 0.0)
//        }
//    }
    var descriptionOfProduct: String?
//    {
//        didSet{
//            descriptionText.text = descriptionOfProduct
//        }
//    }
    var category: String?
//    {
//        didSet{
//            categoryText.text = category
//        }
//    }
    var rating: Rating?
//    {
//        didSet{
//            ratingText.text = "\(rating?.rate ?? 0.0) / \(rating?.count ?? 0)"
//        }
//    }
    
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

}
