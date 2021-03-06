//
//  NewRecipeDetailTableViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class NewRecipeTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    var recipeName: String?
    var recipeAuthor: String?
    var recipeCategory: String?
    var recipeCookTime: String?
    var recipeServingNum: Int?
    var recipeDescription: String?
    var recipeIndex: Int?
    var recipeIngredient: String?
    var recipeProcedure: String?
    
    // MARK: - Outlets
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeInfoLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setRecipeImageView()
        setRecipeAuthorLabel()
        setRecipeTitleLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setRecipeImageView() {
        recipeImageView.image = UIImage(named: "duck-breast")
    }
    
    func setRecipeTitleLabel() {
//        recipeTitleLabel.text = recipeName!
        recipeTitleLabel.textAlignment = .left
        recipeTitleLabel.textColor = .black
        recipeTitleLabel.font = UIFont.systemFont(ofSize: 25)
    }
    
    func setRecipeAuthorLabel() {
//        recipeInfoLabel.text = recipeCookTime!
        recipeInfoLabel.textAlignment = .left
        recipeInfoLabel.textColor = .black
        recipeInfoLabel.font = UIFont.systemFont(ofSize: 15)
    }

}
