//
//  AuthenticationViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 25.10.2022.
//

import UIKit

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
        navigationController?.pushViewController(MainPageViewController(), animated: true)
    }

    @IBAction func signButtonTapped(_ sender: UIButton) {
        openMainPage()
    }
}
