//
//  EventDetailViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class LikedEventDetailViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // Setting the Title attributes
            eventTitleLabel.text = "Event Title"
            eventTitleLabel.textAlignment = .center
            eventTitleLabel.textColor = .white
            eventTitleLabel.font = UIFont.systemFont(ofSize: 24)
            eventTitleLabel.backgroundColor = UIColor.purple
            
            // Setting the ImageView attributes
            eventImageView.image = UIImage(named: "event")
            
            // Setting the TextView attributes
            eventTextView.textAlignment = .left
            eventTextView.text = longString()
            eventTextView.textColor = .black
            eventTextView.font = UIFont.systemFont(ofSize: 20)
            eventTextView.isEditable = false
            eventTextView.isScrollEnabled = true
            eventTextView.isUserInteractionEnabled = false
            eventTextView.backgroundColor = .white
            
            // Add subviews to scrollview
        }
    }
    
    // MARK: - Variables
    
    var eventTitleLabel = UILabel()
    var eventImageView = UIImageView()
    var eventTextView = UITextView()
    
    var eventName = ""
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting Event Label
        var currentHeightScrollable: CGFloat = 0
        let spacer: CGFloat = 10
        
        eventTitleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 30)
        currentHeightScrollable += eventTitleLabel.frame.height + spacer
        scrollView.addSubview(eventTitleLabel)
        
        // Setting Image View
        eventImageView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: view.frame.width)
        currentHeightScrollable += eventImageView.frame.height + spacer
        scrollView.addSubview(eventImageView)
        
        // Setting Text View
        eventTextView.frame = CGRect(x: 0, y: currentHeightScrollable, width: view.frame.width, height: 1000)
        currentHeightScrollable += eventTextView.frame.height
        scrollView.addSubview(eventTextView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: currentHeightScrollable)
        
        eventTitleLabel.text = eventName
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    
    func longString() -> String {
        var str = ""
        for _ in 0...300 {
            str.append("hello ")
        }
        return str
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
