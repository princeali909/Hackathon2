//
//  MapsViewController.swift
//  LoginScreen
//
//  Created by Ali Halawa on 1/18/20.
//  Copyright © 2020 Macbook. All rights reserved.
//



import UIKit
import GoogleMaps

class MapsViewController: UIViewController {
    var locManager = CLLocationManager()

  // You don't need to modify the default init(nibName:bundle:) method.

  override func loadView() {
    locManager.requestWhenInUseAuthorization()
    
    var currentLocation: CLLocation!

    if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){

          currentLocation = locManager.location

    }
    
    let latitude = currentLocation.coordinate.latitude
    let longitude = currentLocation.coordinate.longitude
    
    
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 12.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    view = mapView

    // Creates a marker in the center of the map.
    let marker = GMSMarker()
    marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    marker.title = "Davis"
    marker.snippet = "California"
    marker.map = mapView
    
    
    let button = UIButton(frame: CGRect(x: 300, y: 800, width: 60, height: 50))
    button.backgroundColor = .black
    button.setTitle("R", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

    self.view.addSubview(button)
  }
    
    @objc func buttonAction(sender: UIButton!) {
      print("Request")
    }
}
