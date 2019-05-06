//
//  UserLogInViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/30/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit
import VideoSplashKit
import Firebase

class UserLogInViewController: VideoSplashViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userNameLabel: UILabel! {
        didSet {
            userNameLabel.textColor = UIColor.flatMint()
        }
    }
    
    @IBOutlet weak var passwordLabel: UILabel! {
        didSet {
            passwordLabel.textColor = UIColor.flatMint()
        }
    }
    
    @IBOutlet weak var userNameTextField: UITextField! {
        didSet {
            userNameTextField.autocorrectionType = .no
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.autocorrectionType = .no
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var signinButton: UIButton! {
        didSet {
            signinButton.setTitleColor(UIColor.flatMint(), for: .normal)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.setTitleColor(UIColor.flatMint(), for: .normal)
        }
    }
    
    @IBOutlet weak var continueAsGuestButton: UIButton! {
        didSet {
            continueAsGuestButton.setTitleColor(UIColor.flatMint(), for: .normal)
        }
    }
    
    
    
    // MARK: - Variables
    
    // MARK - Inits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let endEditTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        view.addGestureRecognizer(endEditTapGestureRecognizer)
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        let db = Firestore.firestore()
        readFromFirebase(db: db, fromCollection: .count, fromDocument: "TotalCount")
        insertVideo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Functions
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        // Pull user data from firebase
        if eventCounter == nil || recipeCounter == nil || userCounter == nil {
            return
        }
        if (Users.count == 0) {
            let db = Firestore.firestore()
            for i in 0..<userCounter! {
                readFromFirebase(db: db, fromCollection: .user, fromDocument: "User" + String(i))
            }
        }
        if Events.count == 0 {
            let db = Firestore.firestore()
            for i in 0..<eventCounter! {
                readFromFirebase(db: db, fromCollection: .event, fromDocument: "Event" + String(i))
            }
        }
        if Recipes.count == 0 {
            let db = Firestore.firestore()
            for i in 0..<recipeCounter! {
                readFromFirebase(db: db, fromCollection: .recipe, fromDocument: "Recipe" + String(i))
            }
        }
        if let userIndex = userToIndex[userNameTextField.text!] {
            if let userDict = Users[userIndex] as? Dictionary<String, Any> {
                if let password = userDict["Password"] as? String {
                    if password == passwordTextField.text {
                        userIsLoggedIn = true
                        currentUser = userNameTextField.text
                        performSegue(withIdentifier: "SignInSegue", sender: self)
                        return
                    }
                }
            }
        }
        let alt = UIAlertController(title: "", message: "Invalid Log in", preferredStyle: .alert)
        alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            (_)in
        }))
        self.present(alt, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if (Users.count == 0) {
            let db = Firestore.firestore()
            for i in 0..<userCounter! {
                readFromFirebase(db: db, fromCollection: .user, fromDocument: "User" + String(i))
            }
        }
    }
    
    @IBAction func continueAsGuestButtonTapped(_ sender: UIButton) {
        if eventCounter == nil || recipeCounter == nil || userCounter == nil {
            return
        }
        if (Users.count == 0) {
            let db = Firestore.firestore()
            for i in 0..<userCounter! {
                readFromFirebase(db: db, fromCollection: .user, fromDocument: "User" + String(i))
            }
        }
        if Events.count == 0 {
            let db = Firestore.firestore()
            for i in 0..<eventCounter! {
                readFromFirebase(db: db, fromCollection: .event, fromDocument: "Event" + String(i))
            }
        }
        if Recipes.count == 0 {
            let db = Firestore.firestore()
            for i in 0..<recipeCounter! {
                readFromFirebase(db: db, fromCollection: .recipe, fromDocument: "Recipe" + String(i))
            }
        }
        if Recipes.count == 0 || Events.count == 0 || Users.count == 0 {
            return
        }
        userIsLoggedIn = false
        performSegue(withIdentifier: "SignInSegue", sender: self)
    }
    
    @IBAction func unwindToLoginPage(segue: UIStoryboardSegue) {}
    
    func insertVideo() {
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "test", ofType: "mov")!)
//        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "IMG_8550.MOV", ofType: "MOV")!)
        self.videoFrame = view.frame
        self.fillMode = .resizeAspectFill
        self.alwaysRepeat = true
        self.sound = false
        self.startTime = 3.0
        self.duration = 10.0
        self.alpha = 0.7
        self.backgroundColor = UIColor.black
        self.contentURL = url
        self.restartForeground = true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if userCounter != nil {
            if (Users.count == 0) {
                for i in 0..<userCounter! {
                    let db = Firestore.firestore()
                    readFromFirebase(db: db, fromCollection: .user, fromDocument: "User" + String(i))
                }
            }
        }
        if eventCounter != nil {
            if (Events.count == 0) {
                for i in 0..<eventCounter! {
                    let db = Firestore.firestore()
                    readFromFirebase(db: db, fromCollection: .event, fromDocument: "Event" + String(i))
                }
            }
        }
        if recipeCounter != nil {
            if (Recipes.count == 0) {
                for i in 0..<recipeCounter! {
                    let db = Firestore.firestore()
                    readFromFirebase(db: db, fromCollection: .recipe, fromDocument: "Recipe" + String(i))
                }
            }
        }
    }
    
    @objc func endEdit() {
        if (userNameTextField.isEditing || passwordTextField.isEditing) {
            view.endEditing(true)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
