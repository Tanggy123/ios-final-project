//
//  UploadRecipeViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/30/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class UploadRecipeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // -------------------------------
    // This is where user input recipe information stored
    private var dict: Dictionary<String, Any> = ["CookTime": "",
                                                 "Name": "",
                                                 "Serves": 0,
                                                 "Author": "",
                                                 "Description": "",
                                                 "Ingredient": "",
                                                 "Procedure": "",
                                                 "Category": ""]
    var index = 0
    var hours = 0
    var mins = 0
    var servingNum = 0
    var recipeTitle: String?
    var recipeDescription: String?
    var recipeIngredients: String?
    var recipeProcedure: String?
    var recipeCategory: String?
    // -------------------------------
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            setUserProfileImageView(isSettingAttributes: true)
            setRecipeTitleLabel(isSettingAttributes: true)
            setRecipeTitleTextField(isSettingAttributes: true)
            setRecipeCategoryLabel(isSettingAttributes: true)
            setRecipeCategoryTextField(isSettingAttributes: true)
            setRecipeDescriptionLabel(isSettingAttributes: true)
            setRecipeDescriptionTextView(isSettingAttributes: true)
            
            setCookingTimeLabel(isSettingAttributes: true)
            setCookingTimeTextField(isSettingAttributes: true)
            setServingNumberLabel(isSettingAttributes: true)
            setServingNumberTextField(isSettingAttributes: true)
            
            setIngredientLabel(isSettingAttributes: true)
            setIngredientTextView(isSettingAttributes: true)
            setProcedureLabel(isSettingAttributes: true)
            setProcedureTextView(isSettingAttributes: true)
            setUploadImageButton(isSettingAttributes: true)
            setUploadCompleteButton(isSettingAttributes: true)
        }
    }
    
    // MARK: - Variables
    
    var userProfileImageView = UIImageView()
    var recipeTitleLabel = UILabel()
    var recipeTitleTextField = UITextField()
    var recipeCategoryLabel = UILabel()
    var recipeCategoryTextField = UITextField()
    var recipeDescriptionLabel = UILabel()
    var recipeDescriptionTextView = UITextView()
    
    var cookingTimeLabel = UILabel()
    var cookingTimeTextField = UITextField()
    var servingNumberLabel = UILabel()
    var servingNumberTextField = UITextField()
    var cookingTimePickerView = UIPickerView()
    var servingNumberPickerView = UIPickerView()
    
    var ingredientLabel = UILabel()
    var ingredientTextView = UITextView()
    var procedureLabel = UILabel()
    var procedureTextView = UITextView()
    var uploadImageButton = UIButton()
    var uploadCompleteButton = UIButton()
    
    var currentHeightScrollable: CGFloat = 10
    
    // MARK: - Inits
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookingTimePickerView.delegate = self
        cookingTimePickerView.dataSource = self
        servingNumberPickerView.delegate = self
        servingNumberPickerView.dataSource = self
        
        let endEditTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        scrollView.addGestureRecognizer(endEditTapGestureRecognizer)
        scrollView.backgroundColor = UIColor.flatMintColorDark()
        
        setUserProfileImageView(isSettingAttributes: false)
        setRecipeTitleLabel(isSettingAttributes: false)
        setRecipeTitleTextField(isSettingAttributes: false)
        setRecipeCategoryLabel(isSettingAttributes: false)
        setRecipeCategoryTextField(isSettingAttributes: false)
        setRecipeDescriptionLabel(isSettingAttributes: false)
        setRecipeDescriptionTextView(isSettingAttributes: false)
        
        setCookingTimeLabel(isSettingAttributes: false)
        setCookingTimeTextField(isSettingAttributes: false)
        setServingNumberLabel(isSettingAttributes: false)
        setServingNumberTextField(isSettingAttributes: false)
        
        setIngredientLabel(isSettingAttributes: false)
        setIngredientTextView(isSettingAttributes: false)
        setProcedureLabel(isSettingAttributes: false)
        setProcedureTextView(isSettingAttributes: false)
        setUploadImageButton(isSettingAttributes: false)
        setUploadCompleteButton(isSettingAttributes: false)
        scrollView.contentSize = CGSize(width: view.frame.width, height: currentHeightScrollable + 100)
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Functions
    func setUserProfileImageView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            userProfileImageView.image = UIImage(named: "user-profile")!
        } else {
            userProfileImageView.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
            currentHeightScrollable += userProfileImageView.frame.height + 30
            scrollView.addSubview(userProfileImageView)
        }
    }
    
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
    
    func setRecipeCategoryLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeCategoryLabel.text = "Describe your recipe category"
            recipeCategoryLabel.textAlignment = .left
            recipeCategoryLabel.textColor = .black
            recipeCategoryLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            recipeCategoryLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += recipeCategoryLabel.frame.height
            scrollView.addSubview(recipeCategoryLabel)
        }
    }
    
    func setRecipeCategoryTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeCategoryTextField.borderStyle = .roundedRect
        } else {
            recipeCategoryTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 40)
            currentHeightScrollable += recipeCategoryTextField.frame.height + 30
            scrollView.addSubview(recipeCategoryTextField)
        }
    }
    
    func setRecipeDescriptionLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            recipeDescriptionLabel.text = "Recipe Description"
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
    
    func setCookingTimeLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            cookingTimeLabel.text = "Cooking Time"
            cookingTimeLabel.textAlignment = .left
            cookingTimeLabel.textColor = .black
            cookingTimeLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            cookingTimeLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += cookingTimeLabel.frame.height
            scrollView.addSubview(cookingTimeLabel)
        }
    }
    
    func setCookingTimeTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            cookingTimeTextField.borderStyle = .roundedRect
            cookingTimeTextField.inputView = cookingTimePickerView
        } else {
            cookingTimeTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += cookingTimeTextField.frame.height + 20
            scrollView.addSubview(cookingTimeTextField)
        }
    }
    
    func setServingNumberLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            servingNumberLabel.text = "Serves"
            servingNumberLabel.textAlignment = .left
            servingNumberLabel.textColor = .black
            servingNumberLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            servingNumberLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += servingNumberLabel.frame.height
            scrollView.addSubview(servingNumberLabel)
        }
    }
    
    func setServingNumberTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            servingNumberTextField.borderStyle = .roundedRect
            servingNumberTextField.inputView = servingNumberPickerView
        } else {
            servingNumberTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += servingNumberTextField.frame.height + 20
            scrollView.addSubview(servingNumberTextField)
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
    
    func setUploadImageButton(isSettingAttributes: Bool) {
        if isSettingAttributes {
            uploadImageButton.setAttributedTitle(NSAttributedString(string: "Upload Image", attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue, NSAttributedString.Key.underlineColor: UIColor.flatMintColorDark()]), for: .normal)
            uploadImageButton.setTitleColor(UIColor.blue, for: .normal)
            uploadImageButton.contentHorizontalAlignment = .left
            uploadImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            //            uploadImageButton.addTarget(self, action: #selector(uploadImageButtonTapped), for: .touchUpInside)
        } else {
            uploadImageButton.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += uploadImageButton.frame.height + 15
            scrollView.addSubview(uploadImageButton)
        }
    }
    
    func setUploadCompleteButton(isSettingAttributes: Bool) {
        if isSettingAttributes {
            uploadCompleteButton.setTitle("Upload", for: .normal)
            uploadCompleteButton.setTitleColor(UIColor.white, for: .normal)
            uploadCompleteButton.backgroundColor = UIColor.flatMint()
            uploadCompleteButton.addTarget(self, action: #selector(uploadCompleteButtonTapped), for: .touchUpInside)
        } else {
            uploadCompleteButton.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += uploadCompleteButton.frame.height
            scrollView.addSubview(uploadCompleteButton)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == cookingTimePickerView) {
            return 2
        } else {
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == cookingTimePickerView) {
            if component == 0 {
                return 10
            } else {
                return 60
            }
        } else {
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == cookingTimePickerView) {
            return String(row)
        } else {
            return String(row + 1)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == cookingTimePickerView) {
            var str = ""
            if (component == 0) {
                hours = row
            } else {
                mins = row
            }
            if (hours == 0) {
                str = String(mins) + " mins"
            } else if (mins == 0) {
                str = String(hours) + " hours"
            } else {
                str = String(hours) + " hours, " + String(mins) + " mins"
            }
            cookingTimeTextField.text = str
        } else {
            servingNum = row + 1
            servingNumberTextField.text = String(row + 1)
        }
    }

    
    @objc func uploadCompleteButtonTapped() {
        if (recipeTitleTextField.text == "" || recipeDescriptionTextView.text == "" || ingredientTextView.text == "" || procedureTextView.text == "" || cookingTimeTextField.text == "" || servingNumberTextField.text == "" || recipeCategoryTextField.text == "") {
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
            recipeCategory = recipeCategoryTextField.text
            
            var cookTime = ""
            if (hours == 0) {
                cookTime = String(mins) + " mins"
            } else if (mins == 0) {
                cookTime = String(hours) + " hours"
            } else {
                cookTime = String(hours) + " hours, " + String(mins) + " mins"
            }
            
            dict["CookTime"] = cookTime
            dict["Name"] = recipeTitle
            dict["Serves"] = servingNum
            dict["Author"] = currentUser
            dict["Description"] = recipeDescription
            dict["Ingredient"] = recipeIngredients
            dict["Procedure"] = recipeProcedure
            dict["Category"] = recipeCategory
            dict["Index"] = recipeCounter
            
            writeToFirebase(toCollection: .recipe, toDocument: "Recipe" + String(recipeCounter!), withDictionary: dict)
            Events[recipeCounter!] = dict
            recipeCounter! += 1
            
            
            let alt = UIAlertController(title: "", message: "Upload Successful", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                self.performSegue(withIdentifier: "RecipeUploadCompleteSegue", sender: self)
            }))
            self.present(alt, animated: true, completion: nil)
        }
    }
    
    @objc func endEdit() {
        if (cookingTimeTextField.isEditing || servingNumberTextField.isEditing) {
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
