//
//  ProductsViewModel.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 3.11.2022.
//

import Foundation
import ShoppingAppAPI

protocol ProductsViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: Error)
    func didFetchProducts()
}

protocol ProductsViewModelProtocol{
    var delegate: ProductsViewModelDelegate? {get set}
    var numberOfRows: Int {get}
    func titleForRow(_ row: Int) -> String?
    func imageUrl(_ row: Int) -> String?
    func idForRow(_ row: Int) -> Int?
    func priceForRow(_ row: Int) -> Double?
    func descriptionForRow(_ row: Int) -> String?
    func categoryForRow(_ row: Int) -> String?
    func ratingForRow(_ row: Int) -> Rating?
    func fetchProducts()
}

final class ProductsViewModel: ProductsViewModelProtocol{
    var numberOfRows: Int{
        products.count
    }
    
    func titleForRow(_ row: Int) -> String?{
        products[row].title
    }
    
    func imageUrl(_ row: Int) -> String?{
        products[row].image
    }
    
    func idForRow(_ row: Int) -> Int?{
        products[row].id
    }
    
    func priceForRow(_ row: Int) -> Double?{
        products[row].price
    }
    
    func descriptionForRow(_ row: Int) -> String?{
        products[row].description
    }
    
    func categoryForRow(_ row: Int) -> String?{
        products[row].category
    }
    
    func ratingForRow(_ row: Int) -> Rating?{
        products[row].rating
    }
    
    weak var delegate: ProductsViewModelDelegate?
    
    public var products = [Product](){
        didSet{
            self.delegate?.didFetchProducts()
        }
    }
    
    func fetchProducts(){
        fakeStoreServiceProvider.request(.getProducts){ result in
            switch result {
            case .failure(let error):
                self.delegate?.didErrorOccurred(error)
            case .success(let response):
                do{
                    let products = try JSONDecoder().decode([Product].self,
                                                            from: response.data)
                    self.products = products
                }
                catch{
                    self.delegate?.didErrorOccurred(error)
                }
                
            }
        }
    }
}
