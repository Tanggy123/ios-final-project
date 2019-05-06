//
//  LikedEventTableViewController.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit
import Firebase

class LikedEventTableViewController: UITableViewController {
    
    var eventAtRow: [Int] = Array(repeating: 0, count: eventCounter!)
    
    var eventIndex: Int?
    var eventAddress: String?
    var eventDescription: String?
    var eventName: String?
    var eventType: String?
    var eventHost: String?
    var eventLiked: Int?
    var eventTime: Date?

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
        if let events = Users[index]!["LikedEvent"] as? [Int] {
            return events.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedEventTableViewCell", for: indexPath) as? LikedEventTableViewCell
        let userIndex: Int = userToIndex[currentUser!]!
        if let events = Users[userIndex]!["LikedEvent"] as? [Int] {
            let position = events.count - indexPath.row - 1
            cell?.eventImageView.image = UIImage(named: "event")
            let eventIndex = events[position]
            print(indexPath.row)
            print(eventAtRow)
            eventAtRow[indexPath.row] = eventIndex
            cell?.eventTitleLabel.text = Events[eventIndex]!["EventName"] as! String
            let temp = Events[eventIndex]!["Time"] as! Timestamp
            let eventDate = temp.dateValue()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
            dateFormatter.timeZone = NSTimeZone.local
            cell?.eventTimeLabel.text = dateFormatter.string(from: eventDate)
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let eventIndex = eventAtRow[indexPath.row]
        if let event = Events[eventIndex] {
            print(event)
            eventAddress = event["Address"] as? String
            eventDescription = event["Description"] as? String
            eventName = event["EventName"] as? String
            eventType = event["EventType"] as? String
            eventHost = event["Host"] as? String
            eventLiked = event["Liked"] as? Int
            self.eventIndex = eventIndex as? Int
            if let stamp = event["Time"] as? Timestamp {
                eventTime = stamp.dateValue()
            }
        }
        performSegue(withIdentifier: "ShowEvenDetailFromLiked", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? LikedEventDetailViewController {
            dest.eventAddress = eventAddress
            dest.eventName = eventName
            dest.eventDescription = eventDescription
            dest.eventType = eventType
            dest.eventHost = eventHost
            dest.eventLiked = eventLiked
            dest.eventTime = eventTime
            dest.eventIndex = eventIndex
        }
    }
 

}
