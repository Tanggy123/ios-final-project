//
//  MapViewController.swift
//  Final project
//
//  Created by 徐乾智 on 4/8/19.
//  Copyright © 2019 徐乾智. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var refreshButton: UIButton! {
        didSet {
            refreshButton.setTitleColor(themeColor, for: .normal)
        }
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.barTintColor = UIColor.flatMintColorDark()
            searchBar.tintColor = .white
            searchBar.showsCancelButton = true
        }
        
    }
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            
        }
    }
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        mapView.delegate = self
        searchBar.delegate = self
        super.viewDidLoad()
        setUp()
        for eventIndex in Events.keys {
            self.fetchLocationFromAddress(eventIndex: eventIndex)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for eventIndex in Events.keys {
            self.fetchLocationFromAddress(eventIndex: eventIndex)
        }
    }
        
//        let initialLoc = CLLocation(latitude: 37.87, longitude: -122.26)
//        let coordinateRegion = MKCoordinateRegion(center: initialLoc.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
//        mapView.setRegion(coordinateRegion, animated: true)
//
        
        // Do any additional setup after loading the view.
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations.last!.coordinate.latitude, longitude: locations.last!.coordinate.longitude), latitudinalMeters: 1500, longitudinalMeters: 1500)
        self.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access location")
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        for i in eventLocation.keys {
            let annotation = MKPointAnnotation()
            let name = Events[i]!["EventName"] as! String
            let type = Events[i]!["EventType"] as! String
            annotation.coordinate = (eventLocation[i]?.coordinate)!
            annotation.title = name
            annotation.subtitle = type
            mapView.addAnnotation(annotation)
        }
    }
    
    
    func setUp() {
        mapView.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() == true {
            if CLLocationManager.authorizationStatus() == .restricted ||
                CLLocationManager.authorizationStatus() == .denied ||
                CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            print("Please turn your location services on!")
        }
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
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        locationManager.stopUpdatingLocation()
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" {
//            return
//        }
//        for i in eventLocation.keys {
//            let address = Events[i]!["Address"] as! String
//            let title = Events[i]!["EventName"] as! String
//            if address.lowercased().contains(searchText.lowercased()) || title.lowercased().contains(searchText.lowercased()) {
//                if let coordinate = eventLocation[i]?.coordinate {
//                    print("reached here in did change")
//                    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//                    let region = MKCoordinateRegion(center: coordinate, span: span)
//                    self.mapView.setRegion(region, animated: true)
//                }
//
//            } else {
//                return
//            }
//        }
//    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            return
        }
        for i in eventLocation.keys {
            let searchText = searchBar.text!
            let address = Events[i]!["Address"] as! String
            let title = Events[i]!["EventName"] as! String
            if address.lowercased().contains(searchText.lowercased()) || title.lowercased().contains(searchText.lowercased()) {
                if let coordinate = eventLocation[i]?.coordinate {
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    let region = MKCoordinateRegion(center: coordinate, span: span)
                    self.mapView.setRegion(region, animated: true)
                }
                return

            } else {
                continue
            }
        }
    }
    
//    func getCoordinate( eventIndex: Int,
//                        addressString : String,
//                        completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
//            if error == nil {
//                if let placemark = placemarks?[0] {
//                    let location = placemark.location!
//                    self.eventLocation![eventIndex] = location
//                    completionHandler(location.coordinate, nil)
//                    return
//                }
//            }
//
//            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
//        }
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
