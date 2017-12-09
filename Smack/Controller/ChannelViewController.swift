//
//  ChannelViewController.swift
//  Smack
//
//  Created by Derek on 12/8/17.
//  Copyright © 2017 Derek. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60

    }
}
