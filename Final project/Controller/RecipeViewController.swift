//
//  RecipeViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTable.delegate = self
        recipeTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "recipeTableViewCell") as? RecipeTableViewCell {
            //cell.foodImage.image = UIImage(named: "duck breast")!
            return cell
        }
        return UITableViewCell()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var recipeTable: UITableView!
    
    
    
    // MARK: - Functions
    
    @IBAction func foodTitleTapped(_ sender: UIButton) {
        //performSegue(withIdentifier: "toShowRecipeDetail", sender: self)
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


class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var foodTitle: UIButton!
    
    @IBOutlet weak var authorNameAndDate: UILabel!
    
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
