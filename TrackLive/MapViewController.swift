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
import Ably

class MapViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var searchBox: UITextField!
    
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
        if (manager.location != nil) {
            let locValue:CLLocationCoordinate2D = manager.location!.coordinate
            
            if (self.mapView != nil) {
                self.mapView.camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 10)
                let currentLocation = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
                let marker = GMSMarker(position: currentLocation)
                marker.title = "Me"
                marker.map = mapView
            }
            
            let ably = ARTRealtime(key: TrackLive.art)
            /// Publish a message to the test channel
            let channel = ably.channels.get("test")
//            channel.publish("location", data: JSONSerialization.jsonObject(with: currentLocation, options: JSONSerialization.ReadingOptions)
                //.data(withJSONObject: currentLocation, options: //)//.jsonObject(with: locValue, options: <#T##JSONSerialization.ReadingOptions#>)
               // """ { latitude: "\(locValue.latitude)\", longitude:\" \(locValue.longitude)\ \" """)

            channel.subscribe { message in
                 let text = "\(message.timestamp) \(message.data ?? "")"
            }
        }
    }
}
