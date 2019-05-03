//
//  User.swift
//  Final project
//
//  Created by Jimmy Tang on 4/22/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import Foundation
import FirebaseFirestore

/* Structure to store user info and associated event info.*/
// MARK: - User data
var currentUser: String?
var userIsLoggedIn = false
var UserDictionary: [String: Dictionary<String, Any>] = ["xuqianzhi": ["Name": "xuqianzhi", "Password": "xuqianzhi1998"]]




// MARK: - Event data
var Events: [Int: Dictionary<String, Any>] = [:]
var tappedCellNum = -1
var eventCounter = Events.count


// MARK: - Recipe Data
