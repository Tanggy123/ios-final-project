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
    
    @IBOutlet weak var userNameLabel: UILabel! { didSet { userNameLabel.textColor = UIColor.flatMintColorDark() } }
    
    @IBOutlet weak var passwordLabel: UILabel! { didSet { passwordLabel.textColor = UIColor.flatMintColorDark() } }
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinButton: UIButton! { didSet { signinButton.setTitleColor(UIColor.flatMintColorDark(), for: .normal) } }
    
    @IBOutlet weak var registerButton: UIButton! { didSet { registerButton.setTitleColor(UIColor.flatMintColorDark(), for: .normal) } }
    
    @IBOutlet weak var continueAsGuestButton: UIButton! { didSet { continueAsGuestButton.setTitleColor(UIColor.flatMintColorDark(), for: .normal) } }
    
    
    
    // MARK: - Variables
    var userIsLoggedIn: Bool = false
    
    // MARK - Inits
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        insertVideo()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Functions
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        userIsLoggedIn = true
        performSegue(withIdentifier: "SignInSegue", sender: self)
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
