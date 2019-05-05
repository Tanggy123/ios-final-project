//
//  DemoCell.swift
//  FoldingCell
//
//  Created by Alex K. on 25/12/15.
//  Copyright © 2015 Alex K. All rights reserved.
//

import UIKit
import Firebase

class DemoCell: FoldingCell {
    
    
    
    @IBOutlet weak var eventLikedNum: UILabel! {
        didSet {
            eventLikedNum.text = "2"
        }
    }
    @IBOutlet weak var eventHostLabel: UILabel!
    @IBOutlet weak var closedEventDateLabel: UILabel!
    @IBOutlet weak var closedEventTimeLabel: UILabel!
    @IBOutlet weak var closedEventTypeLabel: UILabel!
    @IBOutlet weak var openEventTitleLabel: UILabel! { didSet { openEventTitleLabel.backgroundColor = UIColor.flatMintColorDark() } }
    @IBOutlet weak var openEventDateLabel: UILabel!
    @IBOutlet weak var openEventTimeLabel: UILabel!
    @IBOutlet weak var openAddressLabel: UILabel!
    @IBOutlet weak var openEventTypeLabel: UILabel!
    
    var number: Int?
    var currentVC: UIViewController?

    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }

    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
    @IBAction func viewDetailButtonTapped(_ sender: UIButton) {
        let position = eventCounter! - number! - 1
        if let currVC = currentVC as? MainTableViewController {
            if let event = Events[position] {
                print("reached here")
                currVC.eventAddress = event["Address"] as? String
                currVC.eventDescription = event["Description"] as? String
                currVC.eventName = event["EventName"] as? String
                currVC.eventType = event["EventType"] as? String
                currVC.eventHost = event["Host"] as? String
                currVC.eventLiked = event["Liked"] as? Int
                currVC.eventIndex = event["Index"] as? Int
                if let stamp = event["Time"] as? Timestamp {
                    currVC.eventTime = stamp.dateValue()
                }
                currVC.performSegue(withIdentifier: "EventDetailSegue", sender: currVC)
            }
        }
        
    }
    
}

// MARK: - Actions ⚡️
