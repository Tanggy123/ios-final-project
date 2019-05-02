//
//  ExperimentViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/23/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var recipeTableView: UITableView! {
        didSet {
            recipeTableView.delegate = self
            recipeTableView.dataSource = self
        }
    }
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell
        cell!.currentVC = self
        cell!.currentSection = indexPath.section
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "All"
        case 1:
            return "Protein"
        case 2:
            return "Seafood"
        case 3:
            return "Vegetarian"
        case 4:
            return "Breakfast"
        case 5:
            return "Dessert and Drink"
        default:
            return ""
        }
    }
    
    // MARK: - Variables
    
    
    // MARK: - Functions
    
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
        if (segue.identifier == "ViewAllSegue") {
            
        }
    }
    

}
