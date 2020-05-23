//
//  ViewController.swift
//  UserDirection
//
//  Created by Alexander Nikolaychuk on 23.05.2020.
//  Copyright © 2020 AlexAlmostEngineer. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewController: UIViewController {
    
    var mapView: GMSMapView!
    var userMarker: GMSMarker!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        createMarker()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func setupMap() {
        let camera = GMSCameraPosition(latitude: 37.3328113, longitude: -122.0411792, zoom: 15.0)
        let map = GMSMapView(frame: view.bounds, camera: camera)
        self.view.addSubview(map)
        mapView = map
    }
    
    func createMarker() {
        let marker = GMSMarker()
        marker.iconView = UserMarker(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        marker.map = mapView
        userMarker = marker
    }
    
    func updateMarkerWith(position: CLLocationCoordinate2D, angle: Double) {
        userMarker.position = position
        guard angle >= 0 && angle < 360 else {
            return
        }
        let angleInRadians: CGFloat = CGFloat(angle) * .pi / CGFloat(180)
        userMarker.iconView?.transform = CGAffineTransform.identity.rotated(by: angleInRadians)
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        let point = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                           longitude: location.coordinate.longitude)
        updateMarkerWith(position: point, angle: location.course)
    }
    
}
