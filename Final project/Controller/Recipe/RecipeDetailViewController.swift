//
//  RecipeDetailViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/11/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit
import WebKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // Set food image view
            setFoodImageView(isSettingAttributes: true)
            
            // Set food title
            setFoodTitleLabel(isSettingAttributes: true)
            
            // Set video view
            
            
            // Set ingredient text view
            setIngredientTextView(isSettingAttributes: true)
            
            // Set procedure text view
            setProcedureTextView(isSettingAttributes: true)
        }
    }
    
    // MARK: - Variables
    var foodImageView = UIImageView()
    var foodTitle = UILabel()
    var videoView = WKWebView()
    var ingredientDescriptionTextView = UITextView()
    var procedureDescriptionTextView = UITextView()
    var spacer: CGFloat = 10
    var currentHeightScrollable: CGFloat = 0
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setFoodImageView(isSettingAttributes: false)
        setFoodTitleLabel(isSettingAttributes: false)
    }
    
    
    
    
    // MARK: - Functions
    func generateLongText(str: String) -> String {
        var str = ""
        for _ in 0...50 {
            str.append(str)
        }
        return str
    }
    
    func setFoodImageView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            foodImageView.image = UIImage(named: "duck-breast")
        } else {
            foodImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 60)
            currentHeightScrollable += foodImageView.frame.height
            scrollView.addSubview(foodImageView)
        }
    }
    
    func setFoodTitleLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            foodTitle.text = "Food Title"
            foodTitle.textAlignment = .left
            foodTitle.textColor = .black
            foodTitle.font = UIFont.systemFont(ofSize: 40)
        } else {
            foodTitle.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 60)
            currentHeightScrollable += foodTitle.frame.height
            scrollView.addSubview(foodTitle)
        }
    }
    
    func setVideoView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            
        } else {
            
        }
    }
    
    func setIngredientTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            ingredientDescriptionTextView.backgroundColor = .lightGray
            ingredientDescriptionTextView.textAlignment = .left
            ingredientDescriptionTextView.textColor = .black
            ingredientDescriptionTextView.text = generateLongText(str: "Ingredient")
            ingredientDescriptionTextView.isEditable = false
            ingredientDescriptionTextView.isScrollEnabled = true
            ingredientDescriptionTextView.isUserInteractionEnabled = false
        } else {
            
        }
    }
    
    func setProcedureTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            procedureDescriptionTextView.backgroundColor = .white
            procedureDescriptionTextView.textAlignment = .left
            procedureDescriptionTextView.textColor = .black
            procedureDescriptionTextView.text = generateLongText(str: "Procedure")
            procedureDescriptionTextView.isEditable = false
            procedureDescriptionTextView.isScrollEnabled = true
            procedureDescriptionTextView.isUserInteractionEnabled = false
        } else {
            
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
