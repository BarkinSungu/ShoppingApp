//
//  Database.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 5.11.2022.
//

import Foundation
import Firebase

final class Database{
    let firestoreDatabase = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    
    func addUserToDB(userID: String){
        let firestorePost = ["userID" : userID as String,
                             "basket": [] as [Int]] as [String : Any]
        
        firestoreDatabase.collection("Users").document(userID).setData(firestorePost)
        
    }
    
    func addProductToBasket(productID: Int){
        let ref = firestoreDatabase.collection("Users").document(userID ?? "")
        ref.updateData(["basket": FieldValue.arrayUnion([productID])])

    }
    
}
