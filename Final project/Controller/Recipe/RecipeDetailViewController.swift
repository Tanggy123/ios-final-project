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
            
            setFoodTypeLabel(isSettingAttributes: true)
            
            // Set food title
            setFoodTitleLabel(isSettingAttributes: true)
            
            setFoodTimeLabel(isSettingAttributes: true)
            
            setShortDescriptionTextView(isSettingAttributes: true)
            
            setLikeButton(isSettingAttributes: true)
            
            // Set video view
            
            
            // Set ingredient text view
            setIngredientLabel(isSettingAttributes: true)
            
            setIngredientTextView(isSettingAttributes: true)
            
            setProcedureLabel(isSettingAttributes: true)
            
            // Set procedure text view
            setProcedureTextView(isSettingAttributes: true)
        }
    }
    
    // MARK: - Variables
    var foodImageView = UIImageView()
    var foodTypeLabel = UILabel()
    var foodTitle = UILabel()
    var foodTimeLabel = UILabel()
    var videoView = WKWebView()
    var shortDescriptionTextView = UITextView()
    var likeButton = UIButton()
    var ingredientLabel = UILabel()
    var ingredientDescriptionTextView = UITextView()
    var procedureLabel = UILabel()
    var procedureDescriptionTextView = UITextView()
    var spacer: CGFloat = 10
    var currentHeightScrollable: CGFloat = 0
    let screenHeightCorrection: CGFloat = 110
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setFoodImageView(isSettingAttributes: false)
        setFoodTypeLabel(isSettingAttributes: false)
        setFoodTitleLabel(isSettingAttributes: false)
        setFoodTimeLabel(isSettingAttributes: false)
        setShortDescriptionTextView(isSettingAttributes: false)
        setLikeButton(isSettingAttributes: false)
        setIngredientLabel(isSettingAttributes: false)
        setIngredientTextView(isSettingAttributes: false)
        setProcedureLabel(isSettingAttributes: false)
        setProcedureTextView(isSettingAttributes: false)
        scrollView.contentSize = CGSize(width: view.frame.width, height: currentHeightScrollable)
    }
    
    
    // MARK: - Functions
    func generateLongText(str: String) -> String {
        var toReturn = ""
        for _ in 0...50 {
            toReturn.append(str)
        }
        return toReturn
    }
    
    func setFoodImageView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            foodImageView.image = UIImage(named: "duck-breast")
        } else {
            foodImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - screenHeightCorrection - 120)
            currentHeightScrollable += foodImageView.frame.height
            scrollView.addSubview(foodImageView)
        }
    }
    
    func setFoodTypeLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            foodTypeLabel.text = "    Breakfast and Brunch"
            foodTypeLabel.textAlignment = .left
            foodTypeLabel.backgroundColor = UIColor.flatMintColorDark()
            foodTypeLabel.textColor = .black
            foodTypeLabel.font = UIFont.systemFont(ofSize: 15)
        } else {
            foodTypeLabel.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += foodTypeLabel.frame.height
            scrollView.addSubview(foodTypeLabel)
        }
    }
    
    func setFoodTitleLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            foodTitle.text = "   Food Title"
            foodTitle.textAlignment = .left
            foodTitle.backgroundColor = UIColor.flatMintColorDark()
            foodTitle.textColor = .black
            foodTitle.font = UIFont.systemFont(ofSize: 30)
            foodTitle.numberOfLines = 3
            foodTitle.lineBreakMode = .byTruncatingTail
        } else {
            foodTitle.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += foodTitle.frame.height
            scrollView.addSubview(foodTitle)
        }
    }
    
    func setFoodTimeLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            foodTimeLabel.text = "    30 mins, serves 2"
            foodTimeLabel.textAlignment = .left
            foodTimeLabel.backgroundColor = UIColor.flatMintColorDark()
            foodTimeLabel.textColor = .black
            foodTimeLabel.font = UIFont.systemFont(ofSize: 15)
        } else {
            foodTimeLabel.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += foodTimeLabel.frame.height
            scrollView.addSubview(foodTimeLabel)
        }
    }
    
    func setVideoView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            
        } else {
            
        }
    }
    
    func setShortDescriptionTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            shortDescriptionTextView.backgroundColor = .lightGray
            shortDescriptionTextView.textAlignment = .left
            shortDescriptionTextView.textColor = .black
            shortDescriptionTextView.font = UIFont.systemFont(ofSize: 20)
            shortDescriptionTextView.text = generateLongText(str: "Short Description ")
            shortDescriptionTextView.isEditable = false
            shortDescriptionTextView.isScrollEnabled = true
            shortDescriptionTextView.isUserInteractionEnabled = false
        } else {
            shortDescriptionTextView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 200)
            currentHeightScrollable += shortDescriptionTextView.frame.height + 20
            scrollView.addSubview(shortDescriptionTextView)
        }
    }
    
    func setLikeButton(isSettingAttributes: Bool) {
        if isSettingAttributes {
            likeButton.setTitle("Like this recipe", for: .normal)
            likeButton.setTitleColor(UIColor.black, for: .normal)
            likeButton.backgroundColor = UIColor.flatMintColorDark()
            likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        } else {
            likeButton.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += likeButton.frame.height + 30
            scrollView.addSubview(likeButton)
        }
    }
    
    func setIngredientLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            let txt = NSAttributedString(string: "  Ingredient", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue, NSAttributedString.Key.underlineColor: UIColor.flatMintColorDark()])
            ingredientLabel.attributedText = txt
            ingredientLabel.textAlignment = .left
            ingredientLabel.textColor = .black
            ingredientLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            ingredientLabel.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 100)
            currentHeightScrollable += ingredientLabel.frame.height
            scrollView.addSubview(ingredientLabel)
        }
    }
    
    func setIngredientTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            ingredientDescriptionTextView.backgroundColor = .white
            ingredientDescriptionTextView.textAlignment = .left
            ingredientDescriptionTextView.textColor = .black
            ingredientDescriptionTextView.font = UIFont.systemFont(ofSize: 20)
            ingredientDescriptionTextView.text = generateLongText(str: "Ingredient ")
            ingredientDescriptionTextView.isEditable = false
            ingredientDescriptionTextView.isScrollEnabled = true
            ingredientDescriptionTextView.isUserInteractionEnabled = false
        } else {
            ingredientDescriptionTextView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 800)
            currentHeightScrollable += ingredientDescriptionTextView.frame.height
            scrollView.addSubview(ingredientDescriptionTextView)
        }
    }
    
    func setProcedureLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            let txt = NSAttributedString(string: "  Procedure", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue, NSAttributedString.Key.underlineColor: UIColor.flatMintColorDark()])
            procedureLabel.attributedText = txt
            procedureLabel.textAlignment = .left
            procedureLabel.textColor = .black
            procedureLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            procedureLabel.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 100)
            currentHeightScrollable += procedureLabel.frame.height
            scrollView.addSubview(procedureLabel)
        }
    }
    
    func setProcedureTextView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            procedureDescriptionTextView.backgroundColor = .white
            procedureDescriptionTextView.textAlignment = .left
            procedureDescriptionTextView.textColor = .black
            procedureDescriptionTextView.font = UIFont.systemFont(ofSize: 20)
            procedureDescriptionTextView.text = generateLongText(str: "Procedure ")
            procedureDescriptionTextView.isEditable = false
            procedureDescriptionTextView.isScrollEnabled = true
            procedureDescriptionTextView.isUserInteractionEnabled = false
        } else {
            procedureDescriptionTextView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 1000)
            currentHeightScrollable += procedureDescriptionTextView.frame.height
            scrollView.addSubview(procedureDescriptionTextView)
        }
    }
    
    @objc func likeButtonTapped() {
        let alt = UIAlertController(title: "", message: "Recipe added to your like list!", preferredStyle: .alert)
        alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
            (_)in
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
