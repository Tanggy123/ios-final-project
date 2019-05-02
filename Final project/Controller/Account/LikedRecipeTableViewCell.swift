//
//  LikedRecipeTableViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class LikedRecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeAuthor: UILabel!
    

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
        recipeTitleLabel.text = "Recipe Title"
        recipeTitleLabel.textAlignment = .left
        recipeTitleLabel.textColor = .black
        recipeTitleLabel.font = UIFont.systemFont(ofSize: 25)
    }
    
    func setRecipeAuthorLabel() {
        recipeAuthor.text = "XQZ"
        recipeAuthor.textAlignment = .left
        recipeAuthor.textColor = .black
        recipeAuthor.font = UIFont.systemFont(ofSize: 15)
    }


}
