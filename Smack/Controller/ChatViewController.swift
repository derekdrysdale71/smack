//
//  ChatViewController.swift
//  Smack
//
//  Created by Derek on 12/8/17.
//  Copyright © 2017 Derek. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    // Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }

}
