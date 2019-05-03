//
//  AccountViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userProfileImageView: UIImageView! {
        didSet {
            if userIsLoggedIn {
                userProfileImageView.image = UIImage(named: "user-profile")
            } else {
                userProfileImageView.image = UIImage(named: "account-icon")
            }
        }
    }
    
    
    @IBOutlet weak var editInformationButton: UIButton! {
        didSet {
            editInformationButton.addTarget(self, action: #selector(buttonTappedWithoutLogIn), for: .touchUpInside)
            editInformationButton.addTarget(self, action: #selector(editInformationButtonTapped), for: .touchUpInside)
            editInformationButton.setTitle("   " + "Edit Information", for: .normal)
            editInformationButton.contentHorizontalAlignment = .left
            editInformationButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var uploadEventButton: UIButton! {
        didSet {
            uploadEventButton.addTarget(self, action: #selector(buttonTappedWithoutLogIn), for: .touchUpInside)
            uploadEventButton.addTarget(self, action: #selector(uploadEventButtonTapped), for: .touchUpInside)
            uploadEventButton.setTitle("   " + "Upload Event", for: .normal)
            uploadEventButton.contentHorizontalAlignment = .left
            uploadEventButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var uploadRecipeButton: UIButton! {
        didSet {
            uploadRecipeButton.addTarget(self, action: #selector(buttonTappedWithoutLogIn), for: .touchUpInside)
            uploadRecipeButton.addTarget(self, action: #selector(uploadRecipeButtonTapped), for: .touchUpInside)
            uploadRecipeButton.setTitle("   " + "Upload Recipe", for: .normal)
            uploadRecipeButton.contentHorizontalAlignment = .left
            uploadRecipeButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var likedEventButton: UIButton! {
        didSet {
            likedEventButton.addTarget(self, action: #selector(buttonTappedWithoutLogIn), for: .touchUpInside)
            likedEventButton.addTarget(self, action: #selector(likedEventButtonTapped), for: .touchUpInside)
            likedEventButton.setTitle("   " + "Liked Event", for: .normal)
            likedEventButton.contentHorizontalAlignment = .left
            likedEventButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var likedRecipeButton: UIButton! {
        didSet {
            likedRecipeButton.addTarget(self, action: #selector(buttonTappedWithoutLogIn), for: .touchUpInside)
            likedRecipeButton.addTarget(self, action: #selector(likedRecipeButtonTapped), for: .touchUpInside)
            likedRecipeButton.setTitle("   " + "Liked Recipe", for: .normal)
            likedRecipeButton.contentHorizontalAlignment = .left
            likedRecipeButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var userNameButton: UIButton! {
        didSet {
            if userIsLoggedIn {
                userNameButton.setTitle("   " + currentUser!, for: .normal)
            } else {
                userNameButton.setTitle("   " + "Guest", for: .normal)
            }
            userNameButton.setTitleColor(UIColor.black, for: .normal)
            userNameButton.contentHorizontalAlignment = .left
            userNameButton.backgroundColor = UIColor.white
            userNameButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
    }
    
    @IBOutlet weak var logoutButton: UIButton! {
        didSet {
            if userIsLoggedIn {
                logoutButton.setTitle("Log Out", for: .normal)
                logoutButton.setTitleColor(UIColor.red, for: .normal)
            } else {
                logoutButton.setTitle("Sign In", for: .normal)
                logoutButton.setTitleColor(UIColor.black, for: .normal)
            }
            logoutButton.contentHorizontalAlignment = .center
            logoutButton.backgroundColor = UIColor.lightGray
            logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        }
    }
    
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        if userIsLoggedIn {
            let alt = UIAlertController(title: "", message: "Are you sure you want to log Out?", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
                (_)in
                currentUser = nil
                self.performSegue(withIdentifier: "unwindToLoginPage", sender: self)
            }))
            alt.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "unwindToLoginPage", sender: self)
        }
    }
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    @IBAction func unwindToAccount(segue: UIStoryboardSegue) {}
    
    @objc func buttonTappedWithoutLogIn() {
        if !userIsLoggedIn {
            let alt = UIAlertController(title: "", message: "You need to log in first", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
        }
    }
    
    @objc func editInformationButtonTapped() {
        if userIsLoggedIn {
            performSegue(withIdentifier: "EditInformationSegue", sender: self)
        }
    }
    
    @objc func uploadEventButtonTapped() {
        if userIsLoggedIn {
            performSegue(withIdentifier: "UploadEventSegue", sender: self)
        }
    }
    
    @objc func uploadRecipeButtonTapped() {
        if userIsLoggedIn {
            performSegue(withIdentifier: "UploadRecipeSegue", sender: self)
        }
    }
    
    @objc func likedEventButtonTapped() {
        if userIsLoggedIn {
            performSegue(withIdentifier: "LikedEventSegue", sender: self)
        }
    }
    
    @objc func likedRecipeButtonTapped() {
        if userIsLoggedIn {
            performSegue(withIdentifier: "LikedRecipeSegue", sender: self)
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
