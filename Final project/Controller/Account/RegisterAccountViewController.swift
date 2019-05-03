//
//  RegisterAccountViewController.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RegisterAccountViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.backgroundColor = UIColor.flatMint()
        }
    }
    @IBOutlet weak var quitButton: UIButton! {
        didSet {
            quitButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    
    @IBOutlet weak var uploadImageButton: UIButton! {
        didSet {
            uploadImageButton.backgroundColor = UIColor.flatMint()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.flatMintColorDark()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if userNameTextField.text == "" {
            let alt = UIAlertController(title: "", message: "Please type in your user name", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
            return
        } else if Users.keys.contains(userNameTextField.text!) {
            let alt = UIAlertController(title: "", message: "This user name has been used", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
            return
        } else if passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            let alt = UIAlertController(title: "", message: "Type in your password and confirm your password", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
            return
        } else if passwordTextField.text! != confirmPasswordTextField.text! {
            let alt = UIAlertController(title: "", message: "This user name has been used", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
            return
        } else {
            // TODO: Upload user to Firebase
            let alt = UIAlertController(title: "", message: "Register successful!", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                self.performSegue(withIdentifier: "UnwindToLoginFromRegister", sender: self)
            }))
            self.present(alt, animated: true, completion: nil)
        }
    }
    
    @IBAction func quitButtonTapped(_ sender: UIButton) {
        let alt = UIAlertController(title: "", message: "Quit register?", preferredStyle: .alert)
        alt.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "UnwindToLoginFromRegister", sender: self)
        }))
        alt.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {
            (_)in
            alt.dismiss(animated: true, completion: nil)
        }))
        self.present(alt, animated: true, completion: nil)
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
