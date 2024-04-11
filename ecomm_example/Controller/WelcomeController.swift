//
//  ViewController.swift
//  ecomm_example
//
//  Created by Tejash Singh on 11/04/24.
//

import UIKit

class WelcomeController: UIViewController {

        override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func viewProductsBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToProducts", sender: self)
    }
    

}

