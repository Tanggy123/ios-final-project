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
var Users: [String: Dictionary<String, Any>] = ["xuqianzhi": ["Name": "xuqianzhi", "Password": "xuqianzhi1998"]]




// MARK: - Event data
var Events: [Int: Dictionary<String, Any>] = [:]
var tappedCellNum = -1
var eventCounter = Events.count



// MARK: - Recipe Data
var Recipes: [String: Dictionary<String, Any>] = [:]
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

public func readFromFirebase(withDb db: Firestore, fromCollection collec: FirebaseCollection, fromDocument doc: String) -> Dictionary<String, Any> {
    let docRef = db.collection(collec.rawValue).document(doc)
    var toReturn: Dictionary<String, Any> = [:]
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let data = document.data() {
                toReturn = data
            }
        } else {
            print("Document does not exist")
        }
    }
    return toReturn
}
