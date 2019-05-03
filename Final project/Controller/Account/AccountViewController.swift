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
    
    @IBOutlet weak var editInformationButton: UIButton! {
        didSet {
            editInformationButton.setTitle("   " + "Edit Information", for: .normal)
            editInformationButton.contentHorizontalAlignment = .left
            editInformationButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var uploadEventButton: UIButton! {
        didSet {
            uploadEventButton.setTitle("   " + "Upload Event", for: .normal)
            uploadEventButton.contentHorizontalAlignment = .left
            uploadEventButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var uploadRecipeButton: UIButton! {
        didSet {
            uploadRecipeButton.setTitle("   " + "Upload Recipe", for: .normal)
            uploadRecipeButton.contentHorizontalAlignment = .left
            uploadRecipeButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var likedEventButton: UIButton! {
        didSet {
            likedEventButton.setTitle("   " + "Liked Event", for: .normal)
            likedEventButton.contentHorizontalAlignment = .left
            likedEventButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var likedRecipeButton: UIButton! {
        didSet {
            likedRecipeButton.setTitle("   " + "Liked Recipe", for: .normal)
            likedRecipeButton.contentHorizontalAlignment = .left
            likedRecipeButton.backgroundColor = UIColor.flatMintColorDark()
        }
    }
    @IBOutlet weak var userNameButton: UIButton! {
        didSet {
            userNameButton.setTitle("   " + "User Name", for: .normal)
            userNameButton.setTitleColor(UIColor.black, for: .normal)
            userNameButton.contentHorizontalAlignment = .left
            userNameButton.backgroundColor = UIColor.white
            userNameButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let alt = UIAlertController(title: "", message: "Are you sure you want to log Out?", preferredStyle: .alert)
        alt.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToLoginPage", sender: self)
        }))
        alt.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: {
            (_)in
            alt.dismiss(animated: true, completion: nil)
        }))
        self.present(alt, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToAccount(segue: UIStoryboardSegue) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
