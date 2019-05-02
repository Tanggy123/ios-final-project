//
//  UploadEventViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/30/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit

class UploadEventViewController: UIViewController {
    
    
    // -------------------------------
    // This is where user input event information stored
    var eventTitle: String?
    var eventDescription: String?
    var selectedEventDate: Date?
    var selectedEventTime: Date?
    // -------------------------------
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            let endEditTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEdit))
            scrollView.addGestureRecognizer(endEditTapGestureRecognizer)
            setEventTitleLabel(isSettingAttributes: true)
            setEventTitleTextField(isSettingAttributes: true)
            setEventDescriptionLabel(isSettingAttributes: true)
            setEventDescriptionTextField(isSettingAttributes: true)
            setEventDateLabel(isSettingAttributes: true)
            setEventDateTextField(isSettingAttributes: true)
            setEventTimeLabel(isSettingAttributes: true)
            setEventTimeTextField(isSettingAttributes: true)
            setEventDatePickerView(isSettingAttributes: true)
            setEventTimePickerView(isSettingAttributes: true)
            setUploadCompleteButton(isSettingAttributes: true)
        }
    }
    
    // MARK: - Variables
    var eventTitleLabel = UILabel()
    var eventTitleTextField = UITextField()
    var eventDescriptionLabel = UILabel()
    var eventDescriptionTextField = UITextView()
    var eventDateLabel = UILabel()
    var eventTimeLabel = UILabel()
    var eventDateTextField = UITextField()
    var eventTimeTextField = UITextField()
    var eventDatePickerView = UIDatePicker()
    var eventTimePickerView = UIDatePicker()
//    var uploadImageButton = UIButton()
    var uploadCompleteButton = UIButton()
    
    var currentHeightScrollable: CGFloat = 10
    var currentDate = Date()
    
    // MARK: - Inits
    override func viewDidLoad() {
        super.viewDidLoad()
        setEventTitleLabel(isSettingAttributes: false)
        setEventTitleTextField(isSettingAttributes: false)
        setEventDescriptionLabel(isSettingAttributes: false)
        setEventDescriptionTextField(isSettingAttributes: false)
        setEventDateLabel(isSettingAttributes: false)
        setEventDateTextField(isSettingAttributes: false)
        setEventTimeLabel(isSettingAttributes: false)
        setEventTimeTextField(isSettingAttributes: false)
        setEventDatePickerView(isSettingAttributes: false)
        setEventTimePickerView(isSettingAttributes: false)
        setUploadCompleteButton(isSettingAttributes: false)
        scrollView.contentSize = CGSize(width: view.frame.width, height: currentHeightScrollable + 400)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Functions
    func setEventTitleLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventTitleLabel.text = "Event Title"
            eventTitleLabel.textAlignment = .left
            eventTitleLabel.textColor = .black
            eventTitleLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            eventTitleLabel.frame = CGRect(x: 10, y: 10, width: view.frame.width, height: 40)
            currentHeightScrollable += eventTitleLabel.frame.height
            scrollView.addSubview(eventTitleLabel)
        }
    }
    
    func setEventTitleTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventTitleTextField.borderStyle = .roundedRect
        } else {
            eventTitleTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 40)
            currentHeightScrollable += eventTitleTextField.frame.height
            scrollView.addSubview(eventTitleTextField)
        }
    }
    
    func setEventDescriptionLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventDescriptionLabel.text = "Event Description"
            eventDescriptionLabel.textAlignment = .left
            eventDescriptionLabel.textColor = .black
            eventDescriptionLabel.font = UIFont.systemFont(ofSize: 30)
        } else {
            eventDescriptionLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 40)
            currentHeightScrollable += eventDescriptionLabel.frame.height
            scrollView.addSubview(eventDescriptionLabel)
        }
    }
    
    func setEventDescriptionTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventDescriptionTextField.isEditable = true
            eventDescriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
            eventDescriptionTextField.layer.borderWidth = 0.5
            eventDescriptionTextField.layer.cornerRadius = 5.0
            eventDescriptionTextField.font = UIFont.systemFont(ofSize: 24)
        } else {
            eventDescriptionTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 300)
            currentHeightScrollable += eventDescriptionTextField.frame.height
            scrollView.addSubview(eventDescriptionTextField)
        }
    }
    
    
    func setEventDateLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventDateLabel.text = "Choose event date"
            eventDateLabel.textAlignment = .left
            eventDateLabel.textColor = .black
            eventDateLabel.font = UIFont.systemFont(ofSize: 15)
        } else {
            eventDateLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 30)
            currentHeightScrollable += eventDateLabel.frame.height
            scrollView.addSubview(eventDateLabel)
        }
    }
    
    func setEventDateTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventDateTextField.borderStyle = .roundedRect
            eventDateTextField.inputView = eventDatePickerView
        } else {
            eventDateTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += eventDateTextField.frame.height + 10
            scrollView.addSubview(eventDateTextField)
        }
    }
    
    func setEventTimeLabel(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventTimeLabel.text = "Choose event time"
            eventTimeLabel.textAlignment = .left
            eventTimeLabel.textColor = .black
            eventTimeLabel.font = UIFont.systemFont(ofSize: 15)
        } else {
            eventTimeLabel.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width, height: 30)
            currentHeightScrollable += eventTimeLabel.frame.height
            scrollView.addSubview(eventTimeLabel)
        }
    }
    
    func setEventTimeTextField(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventTimeTextField.borderStyle = .roundedRect
            eventTimeTextField.inputView = eventTimePickerView
        } else {
            eventTimeTextField.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += eventTimeTextField.frame.height + 10
            scrollView.addSubview(eventTimeTextField)
        }
    }
    
    
    func setEventDatePickerView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventDatePickerView.datePickerMode = .date
            eventDatePickerView.addTarget(self, action: #selector(eventDateChanged(datePicker:)), for: .valueChanged)
        } else {
        }
    }
    
    func setEventTimePickerView(isSettingAttributes: Bool) {
        if isSettingAttributes {
            eventTimePickerView.datePickerMode = .time
            eventTimePickerView.addTarget(self, action: #selector(eventTimeChanged(datePicker:)), for: .valueChanged)
        } else {
        }
    }
    
//    func setUploadImageButton(isSettingAttributes: Bool) {
//        if isSettingAttributes {
//            uploadImageButton.setTitle("Upload Image", for: .normal)
//            uploadImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//            uploadImageButton.addTarget(self, action: #selector(uploadImageButtonTapped), for: .touchUpInside)
//        } else {
//
//        }
//    }
    
    func setUploadCompleteButton(isSettingAttributes: Bool) {
        if isSettingAttributes {
            uploadCompleteButton.setTitle("Upload", for: .normal)
            uploadCompleteButton.setTitleColor(UIColor.black, for: .normal)
            uploadCompleteButton.backgroundColor = .lightGray
            uploadCompleteButton.addTarget(self, action: #selector(uploadCompleteButtonTapped), for: .touchUpInside)
        } else {
            uploadCompleteButton.frame = CGRect(x: 10, y: currentHeightScrollable, width: view.frame.width - 20, height: 50)
            currentHeightScrollable += uploadCompleteButton.frame.height
            scrollView.addSubview(uploadCompleteButton)
        }
    }
    
    @objc func eventDateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        eventDateTextField.text = dateFormatter.string(from: datePicker.date)
        selectedEventDate = datePicker.date
    }
    
    @objc func eventTimeChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        eventTimeTextField.text = dateFormatter.string(from: datePicker.date)
        selectedEventTime = datePicker.date
    }
    
    @objc func endEdit() {
        if (eventDateTextField.isEditing || eventTimeTextField.isEditing) {
            view.endEditing(true)
        }
    }
    
    @objc func uploadCompleteButtonTapped() {
        if (eventTitleTextField.text == "" || eventDescriptionTextField.text == "" || eventDateTextField.text == "" || eventTimeTextField.text == "") {
            let alt = UIAlertController(title: "", message: "Fill in all the blank before uploading", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
            }))
            self.present(alt, animated: true, completion: nil)
        } else {
            eventTitle = eventTitleTextField.text
            eventDescription = eventDescriptionTextField.text
            print(eventTitle!)
            print(eventDescription!)
            let alt = UIAlertController(title: "", message: "Upload Complete", preferredStyle: .alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                (_)in
                self.performSegue(withIdentifier: "EventUploadCompleteSegue", sender: self)
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
