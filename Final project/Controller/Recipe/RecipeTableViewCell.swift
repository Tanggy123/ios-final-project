//
//  ExperimentTableViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 4/23/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var currentSection: Int?
    
    var numItemInSection: [Int] = [3, 5, 4, 2, 12, 10]
    
    var currentVC: UIViewController?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.item < numItemInSection[currentSection!]) {
            currentVC?.performSegue(withIdentifier: "ImageTappedSegue", sender: currentVC)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numItemInSection[currentSection!]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if (numItemInSection[currentSection!] >= 8) {
//            if (indexPath.item == numItemInSection[currentSection!] - 1) {
//                let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeEndCollectionViewCell", for: indexPath) as? RecipeEndCollectionViewCell
//                cell1?.currentVC = currentVC!
//                return cell1!
//            } else {
//                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell
//                cell2?.recipeImage.image = UIImage(named: "duck-breast")!
//                return cell2!
//            }
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell
//            cell?.recipeImage.image = UIImage(named: "duck-breast")!
//            return cell!
//        }
        if (indexPath.item == numItemInSection[currentSection!] - 1) {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeEndCollectionViewCell", for: indexPath) as? RecipeEndCollectionViewCell
            cell1?.currentVC = currentVC!
            return cell1!
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCollectionViewCell", for: indexPath) as? RecipeCollectionViewCell
            cell2?.recipeImage.image = UIImage(named: "duck-breast")!
            return cell2!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        collectionView = recipeCollectionView
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
