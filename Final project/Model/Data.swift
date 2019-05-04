//
//  User.swift
//  Final project
//
//  Created by Jimmy Tang on 4/22/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import Foundation
import Firebase

/* Structure to store user info and associated event info.*/
// MARK: - User data
var currentUser: String?
var userIsLoggedIn = false
var Users: [String: Dictionary<String, Any>] = ["xuqianzhi": ["Name": "xuqianzhi", "Password": "xuqianzhi1998"]]




// MARK: - Event data
var Events: [Int: Dictionary<String, Any>] = [:]
var tappedCellNum = -1
var eventCounter = Events.count



// MARK: - Recipe Data
var Recipes: [Int: Dictionary<String, Any>] = [:]
var recipeCounter = Recipes.count


// MARK: - Functions

public enum FirebaseCollection: String {
    case user = "Users"
    case event = "Events"
    case recipe = "Recipe"
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
                    Users[doc] = dict
                case .recipe:
                    let index = Int(String(doc.last!))
                    Recipes[index!] = dict
                }
            }
        } else {
            print("Document does not exist")
        }
    }
}
