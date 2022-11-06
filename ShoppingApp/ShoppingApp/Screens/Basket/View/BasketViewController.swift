//
//  BasketViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 5.11.2022.
//

import UIKit
import Firebase
import ShoppingAppAPI

class BasketViewController: UIViewController {
    
    //bu classta IDlerden title ulaşmak yerine direkt titleları database e kaydedip çekip gösterebilirdim fakat doğru olanın bu yöntem olduğunu düşündüğüm için boş sayfa dönmesine rağmen bu halde bırakacağım.
    private let firestoreDatabase = Firestore.firestore()
    private let userID = Auth.auth().currentUser?.uid
    
    private var basket: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        getBasket()
    }


    func getBasket(){
        firestoreDatabase.collection("Users").addSnapshotListener { [self] snapshot, error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else{
                self.basket.removeAll() //cleaning the list
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentId = document.documentID
                        if documentId == userID{
                            if let favorites: [Int] = document.get("basket") as? [Int]{
                                self.basket = favorites
                                tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
                            
    }
    
    func fetchProduct(id: Int) -> String{
        var title = ""
        fakeStoreServiceProvider.request(.getProduct(id: id)){ result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                do{
                    let product = try JSONDecoder().decode(Product.self,
                                                            from: response.data)
                    title = product.title ?? ""
                    
                }
                catch{
                    print(error.localizedDescription)
                    
                }
            }
        }
        return title
    }

}

extension BasketViewController: UITableViewDelegate{
    
}

extension BasketViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let productID = basket[indexPath.row]
        let title = fetchProduct(id: productID)
        cell.textLabel?.text = title
        return cell
    }
    
    
}
