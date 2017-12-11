//
//  CreateAccountViewController.swift
//  Smack
//
//  Created by Derek on 12/11/17.
//  Copyright © 2017 Derek. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
