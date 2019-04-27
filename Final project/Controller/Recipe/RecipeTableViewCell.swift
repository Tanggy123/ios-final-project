//
//  ExperimentTableViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 4/23/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell
        cell?.recipeImage.image = UIImage(named: "duck-breast")!
        return cell!
    }
    
    
    var collectionView: UICollectionView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView = recipeCollectionView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var recipeCollectionView: UICollectionView! {
        didSet {
            recipeCollectionView.delegate = self
            recipeCollectionView.dataSource = self
        }
    }
    
}
