//
//  AuthenticationViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 25.10.2022.
//

import UIKit
import Firebase

class AuthenticationViewController: UIViewController {

    @IBOutlet var headerText: UILabel!
    @IBOutlet var emailText: UILabel!
    @IBOutlet var passwordText: UILabel!
    @IBOutlet var secondPasswordText: UILabel!
    @IBOutlet var userNameText: UILabel!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var secondPasswordTextField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var signButton: UIButton!
    
    
    var selectedSegment = "Sign In"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        signInSelected()
    }

    @IBAction func didChangeSegment(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            signInSelected()
        }
        else if sender.selectedSegmentIndex == 1{
            signUpSelected()
        }
    }
    
    func signInSelected(){
        selectedSegment = "Sign In"
        headerText.text = "Sign In"
        signButton.setTitle("Sign In",
                            for: .normal)
        
        secondPasswordText.isHidden = true
        secondPasswordTextField.isHidden = true
        
        userNameText.isHidden = true
        userNameTextField.isHidden = true
    }
    
    func signUpSelected(){
        selectedSegment = "Sign Up"
        headerText.text = "Sign Up"
        signButton.setTitle("Sign Up",
                            for: .normal)
        
        secondPasswordText.isHidden = false
        secondPasswordTextField.isHidden = false
        
        userNameText.isHidden = false
        userNameTextField.isHidden = false
    }
    
    func openMainPage (){
        navigationController?.pushViewController(TabBarController(), animated: true)
    }

    @IBAction func signButtonTapped(_ sender: UIButton) {
        if selectedSegment == "Sign In"{
            login(emailText: emailTextField.text ?? "",
                  passwordText: passwordTextField.text ?? "")
        }
        else if selectedSegment == "Sign Up"{
            registation(emailText: emailTextField.text ?? "",
                        passwordText: passwordTextField.text ?? "",
                        secondPasswordText: secondPasswordTextField.text ?? "")
        }
    }
    
    func login(emailText: String, passwordText: String) {
        print("login work")

        if emailText != "" && passwordText != ""{
            
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { authdataresult, error in
                if error != nil {
                    self.alertMessage(title: "Error", message: error?.localizedDescription ?? "Error")
                    
                }else{
                    self.openMainPage()
                }
            }
            
        }else{
            self.alertMessage(title: "Error", message: "You must enter email and password.")
            
        }
    }
    
    func registation(emailText: String, passwordText: String, secondPasswordText: String){
        print("registration work")
        if emailText != "" && passwordText != "" && secondPasswordText != ""{
            if passwordText == secondPasswordText{
            
                Auth.auth().createUser(withEmail: emailText, password: passwordText) { authdataresult, error in
                    if error != nil{
                        self.alertMessage(title: "Error", message: "Check internet connection.")
                    }else{
                        self.openMainPage()
                        
                    }
                }
            }else{
                self.alertMessage(title: "Error", message: "Passwords must be same!")
            }
            
        }else{
            self.alertMessage(title: "Error", message: "You must enter email and password.")
        }
        
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
