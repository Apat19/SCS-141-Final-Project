//
//  LocationViewController.swift
//  SCS 141 Final Project
//
//  Created by Austin Patton on 4/29/23.
//


import Foundation
import UIKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // Smoky mountain coordinates
    let DominosLatitude = 40.8165
    let DominosLongitude = -79.5220

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation] ){
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        //horizontal accuracy less then 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0{
            let Dominos:CLLocation = CLLocation(latitude: DominosLatitude, longitude: DominosLongitude)
            let delta:CLLocationDistance = Dominos.distance(from: newLocation)
            let miles: Double = (delta * 0.000621371) + 0.5 //meters to rounded miles
            if miles < 3 {
                // stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Enjoy \nDomino's Pizza!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))! + " miles to Domino's Pizza"
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile (in meters)
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
    }


}
