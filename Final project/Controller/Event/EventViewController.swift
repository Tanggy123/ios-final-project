//
//  ViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var eventTable: UITableView!
    
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventTable.dataSource = self
        eventTable.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "eventTableViewCell") as? EventTableViewCell {
            cell.eventImage.image = UIImage(named: "event")!
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    // MARK: - Functions

    @IBAction func eventTitleTapped(_ sender: UIButton) {
        print("yes")
        //performSegue(withIdentifier: "toShowEventDetail", sender: self)
    }
    

}

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventDescriptionField: UITextView!
    
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

