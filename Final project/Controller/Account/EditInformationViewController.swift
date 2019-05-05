//
//  EditInformationViewController.swift
//  Final project
//
//  Created by 徐乾智 on 5/4/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class EditInformationViewController: UIViewController {
    
    // MARK: Variables
    var index: Int = userToIndex[currentUser!]!
    var oldUserName: String = currentUser!
    var oldPassword: String?
    var likedRecipe: Any?
    var likedEvent: Any?
    
    // MARK: Outlets
    @IBOutlet weak var userNameTextField: UITextField! {
        didSet {
            userNameTextField.text = currentUser!
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.text = Users[index]!["Password"] as? String
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = themeColor
        oldPassword = Users[index]!["Password"] as? String
        likedRecipe = Users[index]!["LikedRecipe"]
        likedEvent = Users[index]!["LikedEvent"]
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Function
    @IBAction func updateProfileButtonTapped(_ sender: UIButton) {
        if (userNameTextField.text == "" || passwordTextField.text == "") {
            let alt = UIAlertController(title: "", message: "You cannot have empty user name or password", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
        } else if (userNameTextField.text == oldUserName && passwordTextField.text == oldPassword) {
            self.performSegue(withIdentifier: "EditSuccessfulSegue", sender: self)
        } else {
            let alt = UIAlertController(title: "", message: "Are you sure you wish to update profile?", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
                (_)in
                let dict: Dictionary<String, Any> = ["UserName": self.userNameTextField.text,
                            "Password": self.passwordTextField.text,
                            "LikedRecipe": self.likedRecipe,
                            "LikedEvent": self.likedEvent]
                Users[self.index] = dict
                writeToFirebase(toCollection: .user, toDocument: "User" + String(self.index), withDictionary: dict)
                self.performSegue(withIdentifier: "EditSuccessfulSegue", sender: self)
            }))
            alt.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
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
