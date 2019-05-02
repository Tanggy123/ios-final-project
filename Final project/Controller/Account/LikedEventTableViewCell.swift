//
//  LikedEventTableViewCell.swift
//  Final project
//
//  Created by 徐乾智 on 5/2/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class LikedEventTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setEventImageView()
        setEventTitleLabel()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setEventImageView() {
        eventImageView.image = UIImage(named: "event")
    }
    
    func setEventTitleLabel() {
        eventTitleLabel.text = "Event Title"
        eventTitleLabel.textAlignment = .left
        eventTitleLabel.textColor = .black
        eventTitleLabel.font = UIFont.systemFont(ofSize: 25)
    }
    
    func setEventTimeLabel() {
        eventTimeLabel.text = "Event Time"
        eventTimeLabel.textAlignment = .left
        eventTimeLabel.textColor = .black
        eventTimeLabel.font = UIFont.systemFont(ofSize: 15)
    }

}
