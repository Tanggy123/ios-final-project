//
//  MainTableViewController.swift
//
// Copyright (c) 21/12/15. Ramotion Inc. (http://ramotion.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Firebase
import CoreLocation

class MainTableViewController: UITableViewController {
    
    // Event information stored here
    var eventAddress: String?
    var eventDescription: String?
    var eventName: String?
    var eventType: String?
    var eventHost: String?
    var eventLiked: Int?
    var eventTime: Date?
    var eventIndex: Int?
    

    enum Const {
        static let closeCellHeight: CGFloat = 179
        static let openCellHeight: CGFloat = 488
        static let rowsCount = 5
    }
    
    var cellHeights: [CGFloat] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        for index in 0...eventCounter! - 1 {
            readFromFirebase(fromCollection: .event, fromDocument: "Event" + String(index))
        }
        for index in 0..<recipeCounter! {
            readFromFirebase(fromCollection: .recipe, fromDocument: "Recipe" + String(index))
        }
        setup()
    }
    
    func fetchLocationFromAddress(eventIndex: Int) {
        let address = Events[eventIndex]!["Address"] as! String
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    eventLocation[eventIndex] = location
                    return
                }
            }
        }
    }

    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        tableView.estimatedRowHeight = Const.closeCellHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView.refreshControl?.endRefreshing()
            } 
            self?.tableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? EventDetailViewController {
            dest.eventAddress = eventAddress!
            dest.eventName = eventName!
            dest.eventDescription = eventDescription!
            dest.eventType = eventType!
            dest.eventHost = eventHost!
            dest.eventLiked = eventLiked!
            dest.eventTime = eventTime
            dest.eventIndex = eventIndex!
        }
        
//        if sender is UIButton {
//            if let dest = segue.destination as? EventDetailViewController {
//                if let event = Events[tappedCellNum] {
//                    if let eventTitle = event["EventName"] as? String {
//                        dest.eventName = eventTitle
//                    }
//                }
//            }
//        }
    }
    
}

// MARK: - TableView

extension MainTableViewController {

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return Events.count
    }

    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as DemoCell = cell else {
            return
        }

        cell.backgroundColor = .clear

        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }

        cell.number = indexPath.row
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! DemoCell
        let position = eventCounter! - indexPath.row - 1
        cell.currentVC = self
        if let event = Events[position] {
            if let eventName = event["EventName"] as? String {
                cell.eventTitleLabel.text = eventName
                cell.openEventTitleLabel.text = eventName
            }
            if let address = event["Address"] as? String {
                cell.eventAddressLabel.text = address
                cell.openAddressLabel.text = address
            }
            if let timestamp = event["Time"] as? Timestamp {
                let date = timestamp.dateValue()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "E MMM dd, yyyy"
                dateFormatter.timeZone = NSTimeZone.local
                cell.closedEventDateLabel.text = dateFormatter.string(from: date)
                cell.openEventDateLabel.text = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "h:mm a"
                cell.closedEventTimeLabel.text = dateFormatter.string(from: date)
                cell.openEventTimeLabel.text = dateFormatter.string(from: date)
            }
            if let type = event["Type"] as? String {
                cell.closedEventTypeLabel.text = type
                cell.openEventTypeLabel.text = type
            }
            if let host = event["Host"] as? String {
                cell.eventHostLabel.text = host
            }
        }
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }

    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell

        if cell.isAnimating() {
            return
        }

        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
        
        
//        let position = eventCounter! - indexPath.row - 1
//        if let event = Events[position] {
//            eventAddress = event["Address"] as? String
//            eventDescription = event["Description"] as? String
//            eventName = event["EventName"] as? String
//            eventType = event["Type"] as? String
//            eventHost = event["Host"] as? String
//            eventLiked = event["Liked"] as? Int
//            if let stamp = event["Time"] as? Timestamp {
//                eventTime = stamp.dateValue()
//            }
//            print("in did select row at")
//            print(eventAddress)
//            print(eventDescription)
//            print(eventTime)
        
        }
        
    

    
}
