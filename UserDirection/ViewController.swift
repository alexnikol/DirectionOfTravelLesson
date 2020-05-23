//
//  ViewController.swift
//  UserDirection
//
//  Created by Alexander Nikolaychuk on 23.05.2020.
//  Copyright © 2020 AlexAlmostEngineer. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        let point = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                           longitude: location.coordinate.longitude)
        print("Location \(point), Direction Angle \(location.course)")
    }
    
}
