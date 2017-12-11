//
//  Constants.swift
//  Smack
//
//  Created by Derek on 12/10/17.
//  Copyright © 2017 Derek. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Sucess: Bool) -> ()

//URL Constants
let BASE_URL = "https://slackityslack.herokuapp.com/v1/"
let REGISTER_URL = "\(BASE_URL)account/register"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
