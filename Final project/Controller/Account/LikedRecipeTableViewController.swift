//
//  LikedRecipeTableViewController.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class LikedRecipeTableViewController: UITableViewController {
    
    var recipeAtRow: [Int] = Array(repeating: 0, count: recipeCounter!)
    
    var recipeName: String?
    var recipeAuthor: String?
    var recipeCategory: String?
    var recipeCookTime: String?
    var recipeServingNum: Int?
    var recipeDescription: String?
    var recipeIndex: Int?
    var recipeIngredient: String?
    var recipeProcedure: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let index: Int = userToIndex[currentUser!]!
        if let recipes = Users[index]!["LikedRecipe"] as? [Int] {
            return recipes.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedRecipeTableViewCell", for: indexPath) as? LikedRecipeTableViewCell
        let userIndex: Int = userToIndex[currentUser!]!
        if let recipes = Users[userIndex]!["LikedRecipe"] as? [Int] {
            let position = recipes.count - indexPath.row - 1
            cell?.recipeImageView.image = UIImage(named: "duck-breast")
            let recipeIndex = recipes[position]
            recipeAtRow[indexPath.row] = recipeIndex
            cell?.recipeTitleLabel.text = Recipes[recipeIndex]!["Name"] as! String
            cell?.recipeAuthor.text = Recipes[recipeIndex]!["Author"] as! String
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = recipeAtRow[indexPath.row]
        if let recipe = Recipes[position] {
            recipeName = (recipe["Name"] as? String)!
            recipeCookTime = (recipe["CookTime"] as? String)!
            recipeServingNum = (recipe["Serves"] as? Int)!
            recipeDescription = (recipe["Description"] as? String)!
            recipeIndex = (recipe["Index"] as? Int)!
            recipeIngredient = (recipe["Ingredient"] as? String)!
            recipeProcedure = (recipe["Procedure"] as? String)!
            recipeAuthor = (recipe["Author"] as? String)!
            recipeCategory = (recipe["Category"] as? String)!
            
            performSegue(withIdentifier: "ShowRecipeDetailFromLiked", sender: self)
        }
        
}


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? LikedRecipeDetailViewController {
            dest.recipeName = recipeName!
            dest.recipeCookTime = recipeCookTime!
            dest.recipeCategory = recipeCategory!
            dest.recipeAuthor = recipeAuthor
            dest.recipeProcedure = recipeProcedure
            dest.recipeServingNum = recipeServingNum
            dest.recipeDescription = recipeDescription
            dest.recipeIndex = recipeIndex
            dest.recipeIngredient = recipeIngredient
        }
    }

}
