//
//  MapViewController.swift
//  TrackLive
//
//  Created by Mobile Dev on 31/08/2018.
//  Copyright © 2018 OrtecMobile. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var trackingCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        super.loadView();
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.mapView.camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 50)
        let currentLocation = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "Me"
        marker.map = mapView
    }
}
