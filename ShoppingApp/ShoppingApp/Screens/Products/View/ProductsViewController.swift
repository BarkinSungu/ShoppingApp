//
//  ProductsViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 1.11.2022.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let screenSize: CGRect = UIScreen.main.bounds
    private let cellInset: CGFloat = 8.0
    private let cellMultiplier: CGFloat = 0.5
    private var cellDimension: CGFloat {
        screenSize.width * cellMultiplier - cellInset
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellDimension, height: cellDimension)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(ProductsCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }


}

extension ProductsViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
}

extension ProductsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as! ProductsCollectionViewCell
        
        if #available(iOS 13.0, *) {
            cell.configure(with: UIImage(systemName: "house")!)
        } else {
            // Fallback on earlier versions
        }
        
        return cell
    }
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellDimension, height: cellDimension)
    }
}
