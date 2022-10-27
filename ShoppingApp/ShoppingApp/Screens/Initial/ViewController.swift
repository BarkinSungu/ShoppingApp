//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Barkın Süngü on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.pushViewController(AuthenticationViewController(), animated: true)
    }


}

