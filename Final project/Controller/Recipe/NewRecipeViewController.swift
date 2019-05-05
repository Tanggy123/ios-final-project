//
//  NewRecipeDetailViewController.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class NewRecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: - Variables
    var recipeName: String?
    var recipeAuthor: String?
    var recipeCategory: String?
    var recipeCookTime: String?
    var recipeServingNum = 0
    var recipeDescription = ""
    var recipeIndex = 0
    var recipeIngredient = ""
    var recipeProcedure = ""
    
    

    // MARK: - Outlets
    @IBOutlet weak var recipeTableView: UITableView! {
        didSet {
            recipeTableView.delegate = self
            recipeTableView.dataSource = self
        }
    }
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.barTintColor = UIColor.flatMintColorDark()
        }
    }
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<recipeCounter! {
            readFromFirebase(fromCollection: .recipe, fromDocument: "Recipe" + String(index))
        }
        self.recipeTableView.reloadData()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeCounter!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewRecipeDetailTableViewCell") as? NewRecipeTableViewCell
        let position = recipeCounter! - indexPath.row - 1
        if let recipe = Recipes[position] {
            cell?.recipeTitleLabel.text = (recipe["Name"] as? String)!
            cell?.recipeInfoLabel.text = (recipe["CookTime"] as? String)! + ", Serves " + String((recipe["Serves"] as? Int)!)
//            cell?.recipeServingNum = (recipe["Serves"] as? Int)!
//            cell?.recipeDescription = (recipe["Description"] as? String)!
//            cell?.recipeIndex = (recipe["Index"] as? Int)!
//            cell?.recipeIngredient = (recipe["Ingredient"] as? String)!
//            cell?.recipeProcedure = (recipe["Procedure"] as? String)!
//            cell?.recipeAuthor = (recipe["Author"] as? String)!
//            cell?.recipeCategory = (recipe["Category"] as? String)!
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = recipeCounter! - indexPath.row - 1
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
            performSegue(withIdentifier: "RecipeTappedSegue", sender: self)
        }
    }
    
    
    // MARK: - Functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {

    }
    
    func setUp() {
        if #available(iOS 10.0, *) {
            recipeTableView.refreshControl = UIRefreshControl()
            recipeTableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.recipeTableView.refreshControl?.endRefreshing()
            }
            self?.recipeTableView.reloadData()
        })
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? RecipeDetailViewController {
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
