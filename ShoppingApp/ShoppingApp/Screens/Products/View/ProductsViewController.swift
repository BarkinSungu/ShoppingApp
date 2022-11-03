//
//  ProductsViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 1.11.2022.
//

import UIKit

final class ProductsViewController: UIViewController {
    //MARK: - Properties
    private var viewModel: ProductsViewModel
    
    //MARK: - Init
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let screenSize: CGRect = UIScreen.main.bounds
    private let cellInset: CGFloat = 8.0
    private let cellMultiplier: CGFloat = 0.5
    private var cellDimension: CGFloat {
        screenSize.width * cellMultiplier - cellInset
    }
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.fetchProducts()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: cellDimension, height: cellDimension*4/5)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(ProductsCollectionViewCell.nib(),
                                forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        

    }


}

extension ProductsViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
}

extension ProductsViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.numberOfRows)
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as! ProductsCollectionViewCell
        
        if #available(iOS 13.0, *) {
            cell.configure(imageUrl: viewModel.imageUrl(indexPath.row) ?? "",
                           title: viewModel.titleForRow(indexPath.row) ?? "")
        } else {
            // Fallback on earlier versions
        }
        
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ProductsViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellDimension, height: cellDimension)
    }
}

//MARK: - ProductsViewModelDelegate
extension ProductsViewController: ProductsViewModelDelegate {
    func didErrorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func didFetchProducts() {
        collectionView.reloadData()
    }
    
    
}
