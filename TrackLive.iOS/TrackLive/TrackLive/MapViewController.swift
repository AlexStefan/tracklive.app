//
//  MapViewController.swift
//  TrackLive
//
//  Created by Mobile Dev on 31/08/2018.
//  Copyright © 2018 OrtecMobile. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var trackingCodeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapView.camera = GMSCameraPosition.camera(withLatitude: 52.520736, longitude: 13.409423, zoom: 12)
        let initialLocation = CLLocationCoordinate2DMake(52.520736, 13.409423)
        let marker = GMSMarker(position: initialLocation)
        marker.title = "Berlin"
        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        super.loadView();
    }
}
