//
//  CreateAccountViewController.swift
//  Smack
//
//  Created by Derek on 12/11/17.
//  Copyright © 2017 Derek. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    //Outlets
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userAvatar.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && backgroundColor == nil {
                userAvatar.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let name = userNameText.text , userNameText.text != "" else { return }
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (sucesss) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBackgroundColor(_ sender: Any) {
        let red = CGFloat(arc4random_uniform(255)) / 255
        let green = CGFloat(arc4random_uniform(255)) / 255
        let blue = CGFloat(arc4random_uniform(255)) / 255
        
        backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userAvatar.backgroundColor = self.backgroundColor
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    func setupView() {
        spinner.isHidden = true
        userNameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountViewController.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }

}
