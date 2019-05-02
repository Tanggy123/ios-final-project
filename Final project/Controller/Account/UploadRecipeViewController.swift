//
//  UploadRecipeViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/30/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class UploadRecipeViewController: UIViewController {
    
    // -------------------------------
    // This is where user input recipe information stored
    var recipeTitle: String?
    var recipeDescription: String?
    var recipeIngredients: String?
    var recipeProcedure: String?
    // -------------------------------
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            setRecipeTitleLabel(isSettingAttributes: true)
            setRecipeTitleTextField(isSettingAttributes: true)
            setRecipeDescriptionLabel(isSettingAttributes: true)
            setRecipeDescriptionTextView(isSettingAttributes: true)
            setIngredientLabel(isSettingAttributes: true)
            setIngredientTextView(isSettingAttributes: true)
            setProcedureLabel(isSettingAttributes: true)
            setProcedureTextView(isSettingAttributes: true)
            setUploadCompleteButton(isSettingAttributes: true)
        }
    }
    
    // MARK: - Variables
    var recipeTitleLabel = UILabel()
    var recipeTitleTextField = UITextField()
    var recipeDescriptionLabel = UILabel()
    var recipeDescriptionTextView = UITextView()
    var ingredientLabel = UILabel()
    var ingredientTextView = UITextView()
    var procedureLabel = UILabel()
    var procedureTextView = UITextView()
    var uploadCompleteButton = UIButton()
    
    var currentHeightScrollable: CGFloat = 10
    
    // MARK: - Inits
    override func viewDidLoad() {
        super.viewDidLoad()
        setRecipeTitleLabel(isSettingAttributes: false)
        setRecipeTitleTextField(isSettingAttributes: false)
        setRecipeDescriptionLabel(isSettingAttributes: false)
        setRecipeDescriptionTextView(isSettingAttributes: false)
        setIngredientLabel(isSettingAttributes: false)
        setIngredientTextView(isSettingAttributes: false)
        setProcedureLabel(isSettingAttributes: false)
        setProcedureTextView(isSettingAttributes: false)
        setUploadCompleteButton(isSettingAttributes: false)
        scrollView.contentSize = CGSize(width: view.frame.width, height: currentHeightScrollable + 100)
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Functions
    func setRecipeTitleLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeTitleLabel.text = "Recipe Name"
            recipeTitleLabel.textAlignment = .left
            recipeTitleLabel.textColor = .black
            recipeTitleLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            recipeTitleLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += recipeTitleLabel.frame.height
            scrollView.addSubview(recipeTitleLabel)
        }
    }
    
    func setRecipeTitleTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeTitleTextField.borderStyle = .roundedRect
        } else {
            recipeTitleTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 40)
            currentHeightScrollable += recipeTitleTextField.frame.height + 30
            scrollView.addSubview(recipeTitleTextField)
        }
    }
    
    func setRecipeDescriptionLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeDescriptionLabel.text = "Event Description"
            recipeDescriptionLabel.textAlignment = .left
            recipeDescriptionLabel.textColor = .black
            recipeDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            recipeDescriptionLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += recipeDescriptionLabel.frame.height
            scrollView.addSubview(recipeDescriptionLabel)
        }
    }
    
    func setRecipeDescriptionTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeDescriptionTextView.isEditable = true
            recipeDescriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
            recipeDescriptionTextView.layer.borderWidth = 0.5
            recipeDescriptionTextView.layer.cornerRadius = 5.0
            recipeDescriptionTextView.font = UIFont.systemFont(ofSize: 24)
        } else {
            recipeDescriptionTextView.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 300)
            currentHeightScrollable += recipeDescriptionTextView.frame.height + 30
            scrollView.addSubview(recipeDescriptionTextView)
        }
    }
    
    func setIngredientLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            ingredientLabel.text = "List ingredients needed"
            ingredientLabel.textAlignment = .left
            ingredientLabel.textColor = .black
            ingredientLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            ingredientLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += ingredientLabel.frame.height
            scrollView.addSubview(ingredientLabel)
        }
    }
    
    func setIngredientTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            ingredientTextView.isEditable = true
            ingredientTextView.layer.borderColor = UIColor.lightGray.cgColor
            ingredientTextView.layer.borderWidth = 0.5
            ingredientTextView.layer.cornerRadius = 5.0
            ingredientTextView.font = UIFont.systemFont(ofSize: 24)
        } else {
            ingredientTextView.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 300)
            currentHeightScrollable += ingredientTextView.frame.height + 30
            scrollView.addSubview(ingredientTextView)
        }
    }
    
    func setProcedureLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            procedureLabel.text = "Describe the procedure"
            procedureLabel.textAlignment = .left
            procedureLabel.textColor = .black
            procedureLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            procedureLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += procedureLabel.frame.height
            scrollView.addSubview(procedureLabel)
        }
    }
    
    func setProcedureTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            procedureTextView.isEditable = true
            procedureTextView.layer.borderColor = UIColor.lightGray.cgColor
            procedureTextView.layer.borderWidth = 0.5
            procedureTextView.layer.cornerRadius = 5.0
            procedureTextView.font = UIFont.systemFont(ofSize: 24)
        } else {
            procedureTextView.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 300)
            currentHeightScrollable += procedureTextView.frame.height + 30
            scrollView.addSubview(procedureTextView)
        }
    }
    
    func setUploadCompleteButton(isSettingAttributes: Bool) {
        if isSettingAttributes {
            uploadCompleteButton.setTitle("Upload", for: .normal)
            uploadCompleteButton.setTitleColor(UIColor.black, for: .normal)
            uploadCompleteButton.backgroundColor = .lightGray
            uploadCompleteButton.addTarget(self, action: #selector(uploadCompleteButtonTapped), for: .touchUpInside)
        } else {
            uploadCompleteButton.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += uploadCompleteButton.frame.height
            scrollView.addSubview(uploadCompleteButton)
        }
    }
    
    @objc func uploadCompleteButtonTapped() {
        if (recipeTitleTextField.text == "" || recipeDescriptionTextView.text == "" || ingredientTextView.text == "" || procedureTextView.text == "") {
            let alt = UIAlertController(title: "", message: "Fill in all the blank before uploading", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
            }))
            self.present(alt, animated: true, completion: nil)
        } else {
            recipeTitle = recipeTitleTextField.text
            recipeDescription = recipeDescriptionTextView.text
            recipeIngredients = ingredientTextView.text
            recipeProcedure = procedureTextView.text
            print(recipeTitle!)
            print(recipeDescription!)
            let alt = UIAlertController(title: "", message: "Upload Complete", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                self.performSegue(withIdentifier: "RecipeUploadCompleteSegue", sender: self)
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
