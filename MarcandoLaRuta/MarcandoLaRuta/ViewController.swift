//
//  ViewController.swift
//  MarcandoLaRuta
//
//  Created by Daniel Suso Sánchez on 18/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    private let locationManager = CLLocationManager()
    private var totalDistance : CLLocationDistance = 0

    override func viewDidLoad() {
        super.viewDidLoad()
     
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 50
        
        segmented.selectedSegmentIndex = 0
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            map.showsUserLocation = true
            map.zoomEnabled = true
        }
        else {
            locationManager.stopUpdatingLocation()
            map.showsUserLocation = false
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        self.setMapLocation(newLocation)
        self.setPinAnnotation(newLocation)
        let distanceInMeters = oldLocation.distanceFromLocation(newLocation)
        totalDistance += distanceInMeters
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let alerta = UIAlertController(title: "ERROR", message: "error \(error.code)", preferredStyle: .Alert)
        let accionOK = UIAlertAction(title: "OK", style: .Default, handler:
            { accion in
        })
        alerta.addAction(accionOK)
        self.presentViewController(alerta, animated: true, completion: nil)
    }
    
    func setMapLocation(location: CLLocation) {
        var mapRegion = MKCoordinateRegion()
        mapRegion.center.longitude = location.coordinate.longitude;
        mapRegion.center.latitude = location.coordinate.latitude;
        mapRegion.span.latitudeDelta = 0.005;
        mapRegion.span.longitudeDelta = 0.005;
        map.setRegion(mapRegion, animated: true)
    }
    
    func setPinAnnotation(location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.title = "(Longitud: \(location.coordinate.longitude), Latitud: \(location.coordinate.latitude))"
        pin.subtitle = "Distancia recorrida: \(NSString(format: "%.2f", totalDistance)) metros"
        pin.coordinate = location.coordinate
        map.addAnnotation(pin)
    }

    
    @IBAction func changeSegmented(sender: AnyObject) {
     
        switch segmented.selectedSegmentIndex {
        case 0:
            map.mapType = MKMapType.Standard
        case 1:
            map.mapType = MKMapType.Satellite
        case 2:
            map.mapType = MKMapType.Hybrid
        default:
            map.mapType = MKMapType.Standard
        }
    }
}

