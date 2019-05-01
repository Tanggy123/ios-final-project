//
//  RecipeEndCollectionViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 4/30/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RecipeEndCollectionViewCell: UICollectionViewCell {
    
    var currentVC: UIViewController?
    
    @IBOutlet weak var viewAllButton: UIButton! {
        didSet {
            viewAllButton.setTitle("View All", for: .normal)
        }
    }
    
    @IBAction func viewAllButtonTapped(_ sender: UIButton) {
        currentVC?.performSegue(withIdentifier: "ViewAllSegue", sender: currentVC)
    }
    
    
    
}
