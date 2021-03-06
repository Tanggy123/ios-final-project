//
//  EventDetailViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit
import Firebase

class EventDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            setEventImageView(isSettingAttributes: true)
            setEventTitleLabel(isSettingAttributes: true)
            setEventDateLabel(isSettingAttributes: true)
            setEventTimeLabel(isSettingAttributes: true)
            setLikeButton(isSettingAttributes: true)
            setEventTextView(isSettingAttributes: true)
            
            // Add subviews to scrollview
        }
    }
    
    // MARK: - Variables
    var eventIndex: Int?
    var eventAddress: String?
    var eventDescription: String?
    var eventName: String?
    var eventType: String?
    var eventHost: String?
    var eventLiked: Int?
    var eventTime: Date?
    
    
    var eventImageView = UIImageView()
    var eventTitleLabel = UILabel()
    var eventDateLabel = UILabel()
    var eventTimeLabel = UILabel()
    var likeButton = UIButton()
    var eventTextView = UITextView()
    
    var currentHeightScrollable: CGFloat = 0
    let spacer: CGFloat = 20

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = eventName
        setEventImageView(isSettingAttributes: false)
        setEventTitleLabel(isSettingAttributes: false)
        setEventDateLabel(isSettingAttributes: false)
        setEventTimeLabel(isSettingAttributes: false)
        setLikeButton(isSettingAttributes: false)
        setEventTextView(isSettingAttributes: false)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: currentHeightScrollable)
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func setEventImageView(isSettingAttributes: Bool) {
        if (isSettingAttributes) {
            eventImageView.image = UIImage(named: "event")
        } else {
            eventImageView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: view.frame.width)
            currentHeightScrollable += eventImageView.frame.height + spacer
            scrollView.addSubview(eventImageView)
        }
    }
    
    func setEventTitleLabel(isSettingAttributes: Bool) {
        if (isSettingAttributes) {
            eventTitleLabel.text = eventName!
            eventTitleLabel.textAlignment = .left
            eventTitleLabel.textColor = .black
            eventTitleLabel.numberOfLines = 0
            eventTitleLabel.lineBreakMode = .byWordWrapping
            eventTitleLabel.font = UIFont.systemFont(ofSize: 40)
            eventTitleLabel.backgroundColor = UIColor.white
        } else {
            eventTitleLabel.frame = CGRect(x: 20, y: currentHeightScrollable, width: view.frame.width, height: 80)
            currentHeightScrollable += eventTitleLabel.frame.height
            scrollView.addSubview(eventTitleLabel)
        }
    }
    
    func setEventDateLabel(isSettingAttributes: Bool) {
        if (isSettingAttributes) {
            if eventTime == nil {
                eventDateLabel.text = "Loading..."
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                dateFormatter.timeZone = NSTimeZone.local
                eventDateLabel.text = dateFormatter.string(from: eventTime!)
            }
            eventDateLabel.textAlignment = .left
            eventDateLabel.textColor = .lightGray
            eventDateLabel.font = UIFont.systemFont(ofSize: 15)
            eventDateLabel.backgroundColor = UIColor.white
        } else {
            eventDateLabel.frame = CGRect(x: 20, y: currentHeightScrollable, width: view.frame.width, height: 30)
            currentHeightScrollable += eventDateLabel.frame.height
            scrollView.addSubview(eventDateLabel)
        }
    }
    
    func setEventTimeLabel(isSettingAttributes: Bool) {
        if (isSettingAttributes) {
            if eventTime == nil {
                eventTimeLabel.text = "Loading..."
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                dateFormatter.timeZone = NSTimeZone.local
                eventTimeLabel.text = dateFormatter.string(from: eventTime!)
            }
            eventTimeLabel.textAlignment = .left
            eventTimeLabel.textColor = .lightGray
            eventTimeLabel.font = UIFont.systemFont(ofSize: 15)
            eventTimeLabel.backgroundColor = UIColor.white
        } else {
            eventTimeLabel.frame = CGRect(x: 20, y: currentHeightScrollable, width: view.frame.width, height: 30)
            currentHeightScrollable += eventTimeLabel.frame.height + spacer
            scrollView.addSubview(eventTimeLabel)
        }
    }
    
    func setLikeButton(isSettingAttributes: Bool) {
        if isSettingAttributes {
            likeButton.setTitle("Like this event", for: .normal)
            likeButton.setTitleColor(UIColor.black, for: .normal)
            likeButton.backgroundColor = UIColor.flatMintColorDark()
            likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        } else {
            likeButton.frame = CGRect(x: 20, y: currentHeightScrollable, width: view.frame.width - 40, height: 50)
            currentHeightScrollable += likeButton.frame.height + 30
            scrollView.addSubview(likeButton)
        }
    }
    
    func setEventTextView(isSettingAttributes: Bool) {
        if (isSettingAttributes) {
            eventTextView.textAlignment = .left
            eventTextView.text = eventDescription!
            eventTextView.textColor = .black
            eventTextView.font = UIFont.systemFont(ofSize: 20)
            eventTextView.isEditable = false
            eventTextView.isScrollEnabled = true
            eventTextView.isUserInteractionEnabled = false
            eventTextView.backgroundColor = .white
        } else {
            eventTextView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: generateHeightWithStringLenghth(text: eventDescription!))
            currentHeightScrollable += eventTextView.frame.height
            scrollView.addSubview(eventTextView)
        }
    }
    
    
    
    
    @objc func likeButtonTapped() {
        if currentUser == nil {
            let alt = UIAlertController(title: "", message: "You need to log in first", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                alt.dismiss(animated: true, completion: nil)
            }))
            self.present(alt, animated: true, completion: nil)
        } else {
            let alt = UIAlertController(title: "", message: "Event added to your Like List!", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                let userIndex: Int = userToIndex[currentUser!]!
                if Users[userIndex]!["LikedEvent"] as? String == "None" {
                    var lst = [Int]()
                    lst.append(self.eventIndex!)
                    Users[userIndex]!["LikedEvent"] = lst
                    
                    var dict: Dictionary<String, Any> = Users[userIndex]!
                    dict["LikedEvent"] = lst
                    
                    let db = Firestore.firestore()
                    writeToFirebase(db: db, toCollection: .user, toDocument: "User" + String(userIndex), withDictionary: dict)
                } else {
                    var lst = Users[userIndex]!["LikedEvent"] as! [Int]
                    if !lst.contains(self.eventIndex!) {
                        lst.append(self.eventIndex!)
                        Users[userIndex]!["LikedEvent"] = lst
                        
                        var dict: Dictionary<String, Any> = Users[userIndex]!
                        dict["LikedEvent"] = lst
                        
                        let db = Firestore.firestore()
                        writeToFirebase(db: db, toCollection: .user, toDocument: "User" + String(userIndex), withDictionary: dict)
                    } else {
                        alt.message = "This event is already in your Like list"
                    }
                }
            }))
            self.present(alt, animated: true, completion: nil)
        }
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
