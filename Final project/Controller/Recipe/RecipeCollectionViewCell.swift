//
//  CollectionViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 4/23/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var recipeImage: UIImageView! {
        didSet {
            recipeImage.isUserInteractionEnabled = true
        }
    }
}
