//
//  User.swift
//  Final project
//
//  Created by Jimmy Tang on 4/22/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import Foundation
import Firebase
import CoreLocation

/* Structure to store user info and associated event info.*/
var themeColor: UIColor = UIColor.flatMintColorDark()
// MARK: - User data
var currentUser: String?
var userCounter: Int? {
    didSet {
        let dict = ["EventCount": eventCounter,
                    "RecipeCount": recipeCounter,
                    "UserCount": userCounter]
        writeToFirebase(toCollection: .count, toDocument: "TotalCount", withDictionary: dict)
    }
}
var userToIndex: Dictionary<String, Int> = [:]
var userIsLoggedIn = false
var Users: [Int: Dictionary<String, Any>] = [:]




// MARK: - Event data
public var eventLocation: Dictionary<Int, CLLocation> = [:]
var Events: [Int: Dictionary<String, Any>] = [:]
var tappedCellNum = -1
var eventCounter: Int? {
    didSet {
        let dict = ["EventCount": eventCounter,
                    "RecipeCount": recipeCounter,
                    "UserCount": userCounter]
        writeToFirebase(toCollection: .count, toDocument: "TotalCount", withDictionary: dict)
    }
}



// MARK: - Recipe Data
var Recipes: [Int: Dictionary<String, Any>] = [:]
var recipeCounter: Int? {
    didSet {
        let dict = ["EventCount": eventCounter,
                    "RecipeCount": recipeCounter,
                    "UserCount": userCounter]
        writeToFirebase(toCollection: .count, toDocument: "TotalCount", withDictionary: dict)
    }
}


// MARK: - Functions

public enum FirebaseCollection: String {
    case user = "Users"
    case event = "Events"
    case recipe = "Recipes"
    case count = "Count"
}


public func writeToFirebase(toCollection collec: FirebaseCollection, toDocument doc: String, withDictionary dict: Dictionary<String, Any>) {
    let db = Firestore.firestore()
    db.collection(collec.rawValue).document(doc).setData(dict) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}

public func readFromFirebase(fromCollection collec: FirebaseCollection, fromDocument doc: String) {
    let db = Firestore.firestore()
    let docRef = db.collection(collec.rawValue).document(doc)
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dict = document.data() {
                switch collec {
                case .event:
                    let index = Int(String(doc.last!))
                    Events[index!] = dict
                case .user:
                    let index = Int(String(doc.last!))
                    Users[index!] = dict
                    let user = dict["UserName"] as! String
                    userToIndex[user] = index
                case .recipe:
                    let index = Int(String(doc.last!))
                    Recipes[index!] = dict
                case .count:
                    eventCounter = dict["EventCount"] as! Int
                    print(eventCounter)
                    recipeCounter = dict["RecipeCount"] as! Int
                    print(recipeCounter)
                    userCounter = dict["UserCount"] as! Int
                    print(userCounter)
                }
            }
        } else {
            print("Document does not exist")
        }
    }
}


public func generateHeightWithStringLenghth(text: String) -> CGFloat{
    print(text.count)
    return CGFloat(70 * (text.count / 40 + 1))
}
