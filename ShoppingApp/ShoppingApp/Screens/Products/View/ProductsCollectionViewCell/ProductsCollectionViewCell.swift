//
//  ProductsCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 1.11.2022.
//

import UIKit
import Kingfisher

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    static let identifier = "ProductsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    public func configure(imageUrl: String, title: String){
        setImage(url: imageUrl)
        titleText.text = title
    }
    
    private func setImage(url: String){
        let url = URL(string: url)
        imageView.kf.setImage(with: url)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
    }
}
