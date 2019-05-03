//
//  UserLogInViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/30/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit
import VideoSplashKit

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
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
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
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        insertVideo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Functions
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if let userDict = UserDictionary[userNameTextField.text!] as? Dictionary<String, Any> {
            if let password = userDict["Password"] as? String {
                if password == passwordTextField.text {
                    userIsLoggedIn = true
                    currentUser = userNameTextField.text
                    performSegue(withIdentifier: "SignInSegue", sender: self)
                    return
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
    }
    
    @IBAction func continueAsGuestButtonTapped(_ sender: UIButton) {
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
