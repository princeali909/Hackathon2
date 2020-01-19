//
//  MapsViewController.swift
//  LoginScreen
//
//  Created by Ali Halawa on 1/18/20.
//  Copyright © 2020 Macbook. All rights reserved.
//



import UIKit
import GoogleMaps
import SideMenu
import PopupDialog
import NVActivityIndicatorView


class MapsViewController: UIViewController {
    var locManager = CLLocationManager()
    var onDoneBlock : ((Bool) -> Void)?
    var loadAnimation: NVActivityIndicatorView!
    

  // You don't need to modify the default init(nibName:bundle:) method.
    
    override func loadView() {
//    locManager.requestWhenInUseAuthorization()
    
    var currentLocation: CLLocation!
        
        loadAnimation = NVActivityIndicatorView(frame: CGRect(x: 500, y: 500, width: 200, height: 200), type: NVActivityIndicatorType.ballPulse, color: UIColor.black, padding: 10.5)

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
        getDirections(map: mapView,latitude: latitude,longitude: longitude)
    
    
    let button = UIButton(frame: CGRect(x: 250, y: 675, width: 60, height: 50))
    button.backgroundColor = .black
    button.setTitle("R", for: .normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        button.clipsToBounds = true
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    self.view.addSubview(button)
        
        
        
  }
    
    @objc func buttonAction(sender: UIButton!) {
      print("Request")
        //pull up how may I help you request
        //Then animation
        //Then Match
        
        let vc = RequestPopUpViewController(nibName: "EmailConfirmation", bundle: nil)
        let popup = PopupDialog(viewController: vc,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        present(popup,animated: true, completion: nil)
        
        
        
        
    }
    
    
    func getDirections(map: GMSMapView, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        //Here you need to set your origin and destination points and mode
//        let url = NSURL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood&key=AIzaSyAhKIrr4s0In1c9ac_BBr9isIdUMPV3Rlc")

        
        //OR if you want to use latitude and longitude for source and destination
        let url = NSURL(string: "\("https://maps.googleapis.com/maps/api/directions/json")?origin=\("38.541576"),\("-121.759583")&destination=\("38.561905"),\("-121.766135")&key=AIzaSyAhKIrr4s0In1c9ac_BBr9isIdUMPV3Rlc")

                let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) -> Void in

                    do {
                        if data != nil {
                            let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as!  [String:AnyObject]
        //                        print(dic)

                            let status = dic["status"] as! String
                            var routesArray:String!
                            if status == "OK" {
                                routesArray = (((dic["routes"]!as! [Any])[0] as! [String:Any])["overview_polyline"] as! [String:Any])["points"] as! String
        //                            print("routesArray: \(String(describing: routesArray))")
                            }

                            DispatchQueue.main.async {
                                let path = GMSPath.init(fromEncodedPath: routesArray!)
                                let singleLine = GMSPolyline.init(path: path)
                                singleLine.strokeWidth = 6.0
                                singleLine.strokeColor = .blue
                                singleLine.map = map
                            }
                        }
                    } catch {
                        print("Error")
                    }
                }
                task.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Your code here
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("I'm back")
    }
    
}
