//
//  EventDetailViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    var eventName: String = ""
    
    @IBOutlet weak var eventTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTitle.text = eventName
        // Do any additional setup after loading the view.
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
