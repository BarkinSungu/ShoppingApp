//
//  ProfileViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 28.10.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var emailAdressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailAdressLabel.text = "Email Address: \(Auth.auth().currentUser?.email ?? "")"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
        }catch{
            alertMessage(title: "Error", message: "Logout Fail")
            
        }
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let mainScreen = main.instantiateViewController(withIdentifier: "LoginNavigationViewController")
        mainScreen.modalPresentationStyle = .fullScreen
        self.present(mainScreen,animated: false, completion: nil)
    }
    
    func alertMessage(title: String, message: String) {
       // Create the action buttons for the alert.
       let defaultAction = UIAlertAction(title: "OK",
                            style: .default) { (action) in
        // Respond to user selection of the action.
       }
       
       // Create and configure the alert controller.
       let alert = UIAlertController(title: title,
             message: message,
             preferredStyle: .alert)
       alert.addAction(defaultAction)
            
       self.present(alert, animated: true) {
          // The alert was presented
       }
    }
    
}
