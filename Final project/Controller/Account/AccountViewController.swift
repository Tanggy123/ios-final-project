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
    
    @IBOutlet weak var editInformationButton: UIButton! { didSet { editInformationButton.backgroundColor = UIColor.flatMintColorDark() } }
    @IBOutlet weak var uploadEventButton: UIButton! { didSet { uploadEventButton.backgroundColor = UIColor.flatMintColorDark() } }
    @IBOutlet weak var uploadRecipeButton: UIButton! { didSet { uploadRecipeButton.backgroundColor = UIColor.flatMintColorDark() } }
    @IBOutlet weak var likedEventButton: UIButton! { didSet { likedEventButton.backgroundColor = UIColor.flatMintColorDark() } }
    @IBOutlet weak var likedRecipeButton: UIButton! { didSet { likedRecipeButton.backgroundColor = UIColor.flatMintColorDark() } }
    @IBOutlet weak var userNameButton: UIButton! { didSet { userNameButton.backgroundColor = UIColor.flatMintColorDark() } }
    
    
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
