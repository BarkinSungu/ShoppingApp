//
//  ProductsCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 1.11.2022.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "ProductsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    public func configure(with image: UIImage){
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
    }
}
